// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

import '../../../../domain/services/access_token_service.dart';
import '../../../../ui/blocs/user_account_bloc.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(
    this._apiHttpClient,
    this._accessTokenService,
    this._userAccountBloc,
  );

  final ApiHttpClient _apiHttpClient;
  final AccessTokenService _accessTokenService;
  final UserAccountBlocType _userAccountBloc;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var accessToken = await _accessTokenService.getAccessToken();

    /// Check if the current token is expired or about to expire. In this case
    /// fetch a new token using `await` which will block the request queue until
    /// the token has been refreshed.
    if (accessToken != null && _accessTokenService.isExpired(accessToken)) {
      try {
        _log('Access token expired. Fetching a new one.');
        accessToken = await _accessTokenService.refreshAccessToken();
      } on DioException catch (error) {
        _log('Could not fetch new access token. Logging out.');
        _userAccountBloc.events.logout();
        return handler.reject(error);
      } catch (error) {
        _log('Could not fetch new access token. Logging out.');
        _userAccountBloc.events.logout();
        return handler.reject(DioException(requestOptions: options));
      }
    }

    if (accessToken != null) {
      final headers = Map.of(options.headers);
      headers['Authorization'] = 'Bearer $accessToken';
      final updatedOptions = options.copyWith(headers: headers);
      return handler.next(updatedOptions);
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final currentAccessToken = await _accessTokenService.getAccessToken();

    /// Assuming status code 401 stands for token expired.
    if (err.response?.statusCode == 401) {
      var options = err.response!.requestOptions;

      /// If the token has been updated, repeat the request.
      if (options.headers['Authorization'] != 'Bearer $currentAccessToken') {
        /// Schedule a new microtask and immediately exit the
        /// interceptor to unblock the queue.
        _log('The access token has been updated. Retry the request.');
        unawaited(
          _apiHttpClient.fetch(options).then(
                (r) => handler.resolve(r),
                onError: (e) => handler.reject(e),
              ),
        );
        return;
      }

      String? newToken;

      try {
        _log('Fetching a new access token.');
        newToken = await _accessTokenService.refreshAccessToken();
      } on DioException catch (error) {
        handler.reject(error);
      } catch (error) {
        handler.reject(DioException(requestOptions: options));
      }

      if (newToken == null) {
        _log('Could not fetch new access token. Logging out.');
        _userAccountBloc.events.logout();
        return;
      }

      /// Schedule a new microtask and immediately exit the
      /// interceptor to unblock the queue.
      _log('Retrying the request with the new access token.');
      unawaited(
        _apiHttpClient.fetch(options).then(
              (r) => handler.resolve(r),
              onError: (e) => handler.reject(e),
            ),
      );

      return;
    }

    super.onError(err, handler);
  }

  void _log(String message) {
    log(message, name: runtimeType.toString());
  }
}
