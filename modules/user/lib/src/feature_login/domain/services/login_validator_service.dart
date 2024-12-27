// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

class LoginValidatorService {
  const LoginValidatorService();

  static final _emailRexExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String validateEmail(String email) {
    if (email.isEmpty) {
      throw FieldRequiredErrorModel(
        fieldKey: I18nFieldKeys.email,
        fieldValue: email,
      );
    }
    if (!_emailRexExp.hasMatch(email)) {
      throw FieldErrorModel(
        errorKey: I18nErrorKeys.invalidEmail,
        fieldValue: email,
      );
    }
    return email;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      throw FieldRequiredErrorModel(
        fieldKey: I18nFieldKeys.password,
        fieldValue: password,
      );
    }
    if (password.length < 6 || password.length > 64) {
      throw FieldErrorModel(
        errorKey: I18nErrorKeys.passwordLength,
        fieldValue: password,
      );
    }

    return password;
  }
}
