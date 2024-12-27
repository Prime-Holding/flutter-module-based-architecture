// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/language_picker.dart';

String translateError(BuildContext context, Exception exception) {
  if (exception is ErrorAccessDeniedModel) {
    return 'Unable to open link on this device. Perhaps you are missing the'
        ' right application to open the link.';
  }
  return exception.toString();
}

class ErrorMapperUtil<T> {
  RxFieldException<T> errorMapper(Object error, BuildContext context) {
    if (error is FieldErrorModel) {
      throw RxFieldExceptionFatory.fromFormField<T>(error, context);
    }
    throw error;
  }
}

extension RxFieldExceptionFatory on RxFieldException {
  static RxFieldException<T> fromFormField<T>(
    FieldErrorModel formFieldModel,
    BuildContext context,
  ) =>
      RxFieldException<T>(
        error: context.l10n.getString(formFieldModel.errorKey) ?? '',
        fieldValue: formFieldModel.fieldValue,
      );
}
