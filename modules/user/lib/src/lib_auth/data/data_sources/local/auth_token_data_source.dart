// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// Persist and get auth information in/from data source
/// so this information will be available trough the app
abstract class AuthTokenDataSource {
  /// Get stored access token
  Future<String?> getToken();

  /// Persist access token
  Future<void> saveToken(String newToken);

  /// Get stored refresh token
  Future<String?> getRefreshToken();

  /// Persist new refresh token
  Future<void> saveRefreshToken(String newRefreshToken);

  /// Delete all auth token data
  Future<void> clear();
}

class DataSourceKeys {
  static const token = 'token';
  static const refreshToken = 'refreshToken';
}
