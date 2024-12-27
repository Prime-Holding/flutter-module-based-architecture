// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PinCodeLocalDataSource {
  PinCodeLocalDataSource(
    this._storage,
  );

  final FlutterSecureStorage _storage;
  static const _storedPin = 'storedPin';

  Future<int> getPinLength() async => 4;

  Future<void> writePinToStorage({
    required String key,
    required String? value,
  }) async =>
      await _storage.write(key: key, value: value);

  Future<String?> readPinFromStorage({required String key}) async =>
      await _storage.read(key: key);

  Future<String?> getPinCode() async =>
      await readPinFromStorage(key: _storedPin);
}
