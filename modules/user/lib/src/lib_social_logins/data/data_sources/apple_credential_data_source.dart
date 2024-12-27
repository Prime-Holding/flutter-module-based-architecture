// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../domain/models/cancelled_error_model.dart';

class AppleCredentialDataSource {
  Future<AuthorizationCredentialAppleID> getUsersAppleCredential() async {
    try {
      return await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
    } on SignInWithAppleAuthorizationException catch (error) {
      if (error.code == AuthorizationErrorCode.canceled) {
        throw CancelledErrorModel();
      }

      rethrow;
    }
  }
}
