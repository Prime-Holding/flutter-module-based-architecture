// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

class DesignSystemTheme {
  static ThemeData buildTheme(DesignSystem designSystem) {
    final ThemeData baseTheme;
    final ColorScheme baseColorScheme;
    final designSystemColor = designSystem.colors;

    final isLightTheme = designSystemColor.brightness == Brightness.light;

    if (isLightTheme) {
      baseTheme = ThemeData.light();
    } else {
      baseTheme = ThemeData.dark();
    }

    baseColorScheme = baseTheme.colorScheme;

    final colorScheme = baseColorScheme.copyWith(
      primary: designSystemColor.primaryColor,
      surface: designSystemColor.backgroundColor,
      error: designSystemColor.errorColor,
    );

    // const fontName = 'assets/WorkSans';
    const fontName = 'packages/assets/WorkSans';

    return baseTheme.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: designSystemColor.scaffoldBackgroundColor,
      textTheme: baseTheme.textTheme.apply(fontFamily: fontName),
      primaryTextTheme: baseTheme.primaryTextTheme.apply(fontFamily: fontName),
      iconTheme: baseTheme.iconTheme.copyWith(
        color: designSystemColor.primaryColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        designSystem,
        isLightTheme ? WidgetToolkitTheme.light() : WidgetToolkitTheme.dark(),
        isLightTheme ? ItemPickerTheme.light() : ItemPickerTheme.dark(),
        isLightTheme ? SearchPickerTheme.light() : SearchPickerTheme.dark(),
        isLightTheme
            ? TextFieldDialogTheme.light()
            : TextFieldDialogTheme.dark(),
        isLightTheme ? EditAddressTheme.light() : EditAddressTheme.dark(),
        isLightTheme ? LanguagePickerTheme.light() : LanguagePickerTheme.dark(),
        isLightTheme ? SmsCodeTheme.light() : SmsCodeTheme.dark(),
        isLightTheme ? PinCodeTheme.light() : PinCodeTheme.dark(),
        isLightTheme ? QrScannerTheme.light() : QrScannerTheme.dark(),
      ],
      // Override any material widget themes here if needed.
    );
  }
}
