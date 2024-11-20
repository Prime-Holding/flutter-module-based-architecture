// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// PIN Code repository stores and manages PIN codes and update tokens
class PinCodeRepository {
  /// List of PIN codes accessible via the user ID
  final Map<String, String> _pinCodes = {};

  /// List of PIN update tokens accessible via the user ID
  final Map<String, String> _tokens = {};

  bool savePinCode(String userId, String pinCode) {
    _pinCodes[userId] = pinCode;
    return true;
  }

  String? getPinCode(String userId) => _pinCodes[userId];

  bool saveToken(String userId, String token) {
    _tokens[userId] = token;
    return true;
  }

  String? getToken(String userId) => _tokens[userId];

  bool deleteToken(String userId) {
    _tokens.remove(userId);
    return true;
  }
}
