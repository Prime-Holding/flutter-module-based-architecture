// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../../lib_auth/domain/models/auth_token_model.dart';
import '../../data/repositories/google_auth_repository.dart';
import 'social_login_service.dart';

class GoogleLoginService extends SocialLoginService {
  GoogleLoginService(
    this._googleAuthRepository,
    super.userAccountService,
  );

  final GoogleAuthRepository _googleAuthRepository;

  @override
  Future<AuthTokenModel> authenticate() async {
    final googleUser = await _googleAuthRepository.getUsersGoogleCredential();

    return _googleAuthRepository.googleAuth(googleAuthRequestModel: googleUser);
  }
}
