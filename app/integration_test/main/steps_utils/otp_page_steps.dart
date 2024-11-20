// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../configuration/build_app.dart';
import '../pages/otp_page.dart';

class OtpPageSteps {
  static Future<void> otpAction(PatrolIntegrationTester $) async {
    OtpPage otpPage = OtpPage($);
    await otpPage.enterOtpCode('0000');
  }
}
