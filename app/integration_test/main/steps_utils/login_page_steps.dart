// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../configuration/build_app.dart';
import '../pages/login_page.dart';

class LoginPageSteps {
  static Future<void> loginAction(PatrolIntegrationTester $) async {
    LoginPage loginPage = LoginPage($);
    await loginPage.setTextEmail('admin@email.com');
    await loginPage.setTextPassword('123456');
    await loginPage.tapLoginButton();
  }
}
