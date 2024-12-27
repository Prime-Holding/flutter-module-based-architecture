// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../../lib_auth/domain/models/auth_token_model.dart';
import '../../../lib_auth/domain/services/user_account_service.dart';

abstract class SocialLoginService {
  SocialLoginService(this._userAccountService);

  final UserAccountService _userAccountService;

  Future<AuthTokenModel> authenticate();

  Future<AuthTokenModel> login() async {
    final authToken = await authenticate();
    // Save response tokens
    await _userAccountService.saveTokens(authToken);

    // Subscribe user push token
    await _userAccountService.subscribeForNotifications();

    // Load permissions
    await _userAccountService.loadPermissions();

    return authToken;
  }
}
