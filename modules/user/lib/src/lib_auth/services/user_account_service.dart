// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';

import 'package:notifications/notifications.dart';
import 'package:shared/shared.dart';

import '../models/auth_token_model.dart';
import '../repositories/auth_repository.dart';

class UserAccountService {
  UserAccountService(
    this._authRepository,
    this._pushSubscriptionRepository,
    this._analyticsRepository,
    this._permissionsService,
  );

  final AuthRepository _authRepository;
  final PushNotificationRepository _pushSubscriptionRepository;

  final AnalyticsRepository _analyticsRepository;

  final PermissionsService _permissionsService;

  bool _logoutLocked = false;

  /// Checks the user credentials passed in [username] and [password].
  ///
  /// After successful login saves the auth `token` and `refresh token` to
  /// persistent storage and loads the user permissions.
  Future<void> login({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      throw GenericErrorModel(I18nErrorKeys.wrongEmailOrPassword);
    }

    final authToken = await _authRepository.authenticate(
      email: username,
      password: password,
    );

    /// Save response tokens
    await saveTokens(authToken);

    /// Subscribe user push token
    await subscribeForNotifications();

    /// Load permissions
    await loadPermissions();

    // Set user data
    await _analyticsRepository.setUserIdentifier('logged_in_user_id');
  }

  /// After successful login saves the auth `token` and `refresh token` to
  /// persistent storage.
  Future<void> saveTokens(AuthTokenModel authToken) async {
    await _authRepository.saveToken(authToken.token);
    await _authRepository.saveRefreshToken(authToken.refreshToken);
  }

  /// Subscribe user push token
  Future<void> subscribeForNotifications({bool graceful = true}) async {
    try {
      final notificationsSubscribed =
          await _pushSubscriptionRepository.notificationsSubscribed();

      if (notificationsSubscribed == true) {
        await _pushSubscriptionRepository.subscribeForPushNotifications();
      }
    } catch (e) {
      if (!graceful) {
        rethrow;
      }
      log(e.toString());
    }
  }

  /// Load permissions
  Future<void> loadPermissions({bool graceful = true}) async {
    try {
      await _permissionsService.load();
    } catch (e) {
      if (!graceful) {
        rethrow;
      }
      log(e.toString());
    }
  }

  /// This method logs out the user and delete all stored auth token data.
  ///
  /// After logging out the user it reloads all permissions.
  Future<void> logout() async {
    if (!_logoutLocked) {
      _logoutLocked = true;

      try {
        await _pushSubscriptionRepository.unsubscribeForPushNotifications(true);
      } catch (e) {
        log(e.toString());
      }

      /// Perform user logout
      try {
        await _authRepository.logout();
      } catch (e) {
        log(e.toString());
      }

      /// Clear locally stored auth data
      await _authRepository.clearAuthData();

      // Clear analytics identifiers
      await _analyticsRepository.logout();

      /// Reload user permissions
      await loadPermissions();

      _logoutLocked = false;
    }
  }
}
