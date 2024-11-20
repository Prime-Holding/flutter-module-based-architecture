// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

class EnterMessageFieldService extends TextFieldValidator<String> {
  static const int minLengthRequired = 2;

  @override
  Future<String> validateOnSubmit(String text) async => text;

  @override
  void validateOnType(String text) {
    if (text.length < minLengthRequired) {
      throw FieldErrorModel<String>(
        fieldValue: text,
        errorKey: I18nErrorKeys.invalidMessage,
      );
    }
  }
}
