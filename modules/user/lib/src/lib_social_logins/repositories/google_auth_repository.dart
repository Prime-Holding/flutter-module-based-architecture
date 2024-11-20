// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../../lib_auth/models/auth_token_model.dart';
import '../data_sources/google_auth_data_source.dart';
import '../data_sources/google_credential_data_source.dart';
import '../models/google_auth_request_model.dart';
import '../models/google_credentials_model.dart';

class GoogleAuthRepository {
  GoogleAuthRepository(this._googleAuthDataSource, this._errorMapper,
      this._googleCredentialDataSource);
  final GoogleAuthDataSource _googleAuthDataSource;
  final ErrorMapper _errorMapper;
  final GoogleCredentialDataSource _googleCredentialDataSource;

  Future<AuthTokenModel> googleAuth({
    required GoogleCredentialsModel googleAuthRequestModel,
  }) =>
      _errorMapper.execute(
        () => _googleAuthDataSource.googleAuth(
            GoogleAuthRequestModel.fromGoogleCredentials(
                googleAuthRequestModel)),
      );

  Future<GoogleCredentialsModel> getUsersGoogleCredential() =>
      _errorMapper.execute(() async {
        final credentials =
            await _googleCredentialDataSource.getUsersGoogleCredential();

        return GoogleCredentialsModel.fromGoogleCredentials(credentials);
      });
}
