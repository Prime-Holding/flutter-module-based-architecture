// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../data/repository/pin_code_repository.dart';

class VerifyPinCodeService implements PinCodeService {
  VerifyPinCodeService(this.pinCodeRepository);

  final PinCodeRepository pinCodeRepository;

  static const storedPin = 'storedPin';
  static const firstPin = 'firstPin';

  Future<void> deleteStoredPin() async {
    await pinCodeRepository.writePinToStorage(storedPin, null);
    await pinCodeRepository.writePinToStorage(firstPin, null);
  }

  Future<void> deleteSavedData() async {
    await pinCodeRepository.writePinToStorage(firstPin, null);
  }

  Future<bool> checkIsPinCreated() async =>
      await pinCodeRepository.getPinCode() != null;

  @override
  Future<String> encryptPinCode(String pinCode) async =>
      md5.convert(utf8.encode(pinCode)).toString();

  @override
  Future<int> getPinLength() => pinCodeRepository.getPinLength();

  @override
  Future<String?> verifyPinCode(String pinCode) async =>
      pinCodeRepository.verifyPinCode(pinCode);

  @override
  Future<String?> getPinCode() => pinCodeRepository.getPinCode();

  @override
  Future<bool> savePinCodeInSecureStorage(String pinCode) async => true;
}
