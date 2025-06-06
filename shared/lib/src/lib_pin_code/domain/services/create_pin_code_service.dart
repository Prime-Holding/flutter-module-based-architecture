// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../../domain/models/errors/error_model.dart';
import '../../data/repository/pin_code_repository.dart';

class CreatePinCodeService implements PinCodeService {
  CreatePinCodeService(this._pinCodeRepository);

  final PinCodeRepository _pinCodeRepository;

  static const _storedPin = 'storedPin';
  String? firstPin;

  Future<void> deleteSavedData() async => firstPin = null;

  Future<bool> deleteStoredPin() async {
    await _pinCodeRepository.writePinToStorage(_storedPin, null);
    return await getPinCode() == null;
  }

  Future<bool> checkIsPinCreated() async =>
      await _pinCodeRepository.getPinCode() != null;

  @override
  Future<String> encryptPinCode(String pinCode) async =>
      md5.convert(utf8.encode(pinCode)).toString();

  @override
  Future<int> getPinLength() => _pinCodeRepository.getPinLength();

  @override
  Future<bool> verifyPinCode(String pinCode) async {
    if (firstPin == null) {
      firstPin = pinCode;
      return true;
    }
    if (pinCode == firstPin) {
      await _pinCodeRepository.createPinCode(pinCode);
      await _pinCodeRepository.writePinToStorage(_storedPin, pinCode);
      return true;
    }
    throw ErrorServerGenericModel(
      message: 'PIN code does not match',
    );
  }

  @override
  Future<String?> getPinCode() => _pinCodeRepository.getPinCode();

  @override
  Future<bool> savePinCodeInSecureStorage(String pinCode) async => true;
}
