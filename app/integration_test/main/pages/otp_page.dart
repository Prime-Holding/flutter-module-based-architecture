// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../base/base_page.dart';

class OtpPage extends BasePage {
  OtpPage(super.$);

  Future<void> enterOtpCode(String code) async {
    await $(K.otpInput).enterText(code);
  }
}
