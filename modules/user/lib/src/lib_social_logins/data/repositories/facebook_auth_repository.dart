// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../../../lib_auth/domain/models/auth_token_model.dart';
import '../../domain/models/facebook_auth_request_model.dart';
import '../data_sources/facebook_auth_data_source.dart';
import '../data_sources/facebook_credential_data_source.dart';

class FacebookAuthRepository {
  FacebookAuthRepository(
      this._fbAuthDataSource, this._errorMapper, this._credentialDataSource);
  final FacebookAuthDataSource _fbAuthDataSource;
  final ErrorMapper _errorMapper;
  final FacebookCredentialDataSource _credentialDataSource;

  Future<AuthTokenModel> facebookAuth(
          {required FacebookAuthRequestModel requestModel}) =>
      _errorMapper.execute(
        () => _fbAuthDataSource.facebookAuthenticate(requestModel),
      );

  Future<FacebookAuthRequestModel> getUserFacebookCredentials() async =>
      _errorMapper
          .execute(() => _credentialDataSource.getUsersFacebookCredential());
}
