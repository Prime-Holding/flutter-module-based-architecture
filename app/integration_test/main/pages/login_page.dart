// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../base/base_page.dart';

class LoginPage extends BasePage {
  LoginPage(super.$);

  Future<void> setTextEmail(String email) async {
    await $(K.loginEmail).enterText(email);
  }

  Future<void> setTextPassword(String password) async {
    await $(K.loginPassword).enterText(password);
  }

  Future<void> tapLoginButton() async {
    await $(K.loginButton).tap();
  }
}
