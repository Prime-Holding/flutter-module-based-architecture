// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../base/models/errors/error_model.dart';
import 'verify_pin_code_service.dart';

class UpdatePinCodeService extends VerifyPinCodeService {
  UpdatePinCodeService(
    super.pinCodeRepository, {
    this.token,
    this.isVerificationPinProcess = true,
  });

  final bool isVerificationPinProcess;
  final String? token;

  @override
  Future<String?> verifyPinCode(String pinCode) async {
    final firstPin = await pinCodeRepository.readPinFromStorage(
      key: VerifyPinCodeService.firstPin,
    );

    /// First page: verify current pin code
    if (firstPin == null && isVerificationPinProcess) {
      return pinCodeRepository.verifyPinCode(
        pinCode,
        requestUpdateToken: true,
      );
    }

    /// Second page: set new pin code
    if (firstPin == null) {
      await pinCodeRepository.writePinToStorage(
        VerifyPinCodeService.firstPin,
        pinCode,
      );
      return null;
    }

    /// Third page: confirm new pin code
    if (firstPin == pinCode) {
      await pinCodeRepository.updatePinCode(pinCode, token ?? '');
      await pinCodeRepository.writePinToStorage(
        VerifyPinCodeService.storedPin,
        pinCode,
      );
      return null;
    }

    throw ErrorServerGenericModel(
      message: 'PIN code does not match',
    );
  }
}
