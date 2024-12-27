// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../../domain/models/auth_token_model.dart';
import '../../domain/models/request_models/authenticate_user_request_model.dart';
import '../data_sources/local/auth_token_data_source.dart';
import '../data_sources/remote/auth_data_source.dart';
import '../data_sources/remote/refresh_token_data_source.dart';

class AuthRepository {
  AuthRepository(
    this._errorMapper,
    this._authTokenDataSource,
    this._authDataSource,
    this._refreshTokenDataSource,
  );

  final ErrorMapper _errorMapper;
  final AuthTokenDataSource _authTokenDataSource;
  final AuthDataSource _authDataSource;
  final RefreshTokenDataSource _refreshTokenDataSource;

  /// Get token string if there is one saved
  Future<String?> getToken() =>
      _errorMapper.execute(() => _authTokenDataSource.getToken());

  /// Persist new token string in secure storage
  Future<void> saveToken(String newToken) =>
      _errorMapper.execute(() => _authTokenDataSource.saveToken(newToken));

  /// Get refreshToken string if there is one saved
  Future<String?> getRefreshToken() =>
      _errorMapper.execute(() => _authTokenDataSource.getRefreshToken());

  /// Persist new refreshToken string in secure storage
  Future<void> saveRefreshToken(String newRefreshToken) => _errorMapper
      .execute(() => _authTokenDataSource.saveRefreshToken(newRefreshToken));

  /// Delete all saved tokens
  Future<void> clearAuthData() =>
      _errorMapper.execute(() => _authTokenDataSource.clear());

  /// Fetch a new access token using the current refresh token
  Future<AuthTokenModel> fetchNewToken(String refreshToken) =>
      _errorMapper.execute(() => _refreshTokenDataSource.refresh(
            AuthUserRequestModel(refreshToken: refreshToken),
          ));

  Future<AuthTokenModel> authenticate(
          {String? email, String? password, String? refreshToken}) =>
      _errorMapper.execute(
        () => _authDataSource.authenticate(
          AuthUserRequestModel(
            username: email,
            password: password,
            refreshToken: refreshToken,
          ),
        ),
      );

  Future<void> logout() => _errorMapper.execute(() => _authDataSource.logout());
}
