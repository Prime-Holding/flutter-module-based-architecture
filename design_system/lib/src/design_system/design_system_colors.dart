// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

// Material Design System documentation.
// https://m2.material.io/design/color/the-color-system.html
// https://m2.material.io/design/color/dark-theme.html

@immutable
class DesignSystemColors {
  const DesignSystemColors.light()
      : brightness = Brightness.light,
        primaryColor = const Color(0xff2196f3),
        backgroundColor = Colors.white,
        scaffoldBackgroundColor = Colors.white,
        updateIconAppBarColor = Colors.black,
        appleBackground = const Color(0xFF000000),
        appleButtonText = Colors.white,
        googleBackground = const Color(0xFFFFFFFF),
        googleButtonText = const Color.fromRGBO(0, 0, 0, 0.54);

  const DesignSystemColors.dark()
      : brightness = Brightness.dark,
        primaryColor = const Color(0xffce93d8),
        backgroundColor = Colors.black,
        scaffoldBackgroundColor = Colors.black,
        updateIconAppBarColor = Colors.white,
        appleBackground = const Color(0xFFFFFFFF),
        appleButtonText = Colors.black,
        googleBackground = Colors.black,
        googleButtonText = const Color(0xFFFFFFFF);

  final Brightness brightness;

  /// region Essential (Material and component) colors

  final Color primaryColor;

  final Color backgroundColor;

  final Color scaffoldBackgroundColor;

  final errorColor = Colors.red;

  /// endregion

  /// region App-specific colors

  final inactiveButtonColor = Colors.blueGrey;

  final activeButtonColor = Colors.blue;

  final inactiveButtonTextColor = Colors.grey;

  final activeButtonTextColor = Colors.white;

  final progressIndicatorBackgroundColor = Colors.white;

  /// endregion

  /// region General purpose colors

  final blanchedAlmond = const Color(0xffffebcd);

  final darkSeaGreen = const Color(0xff8fbc8f);

  final snow = const Color(0xfffffafa);

  final black = Colors.black87;

  final white = Colors.white;

  final gray = const Color(0xff808080);

  final Color updateIconAppBarColor;

  final Color appleBackground;

  final Color appleButtonText;

  final facebookBackground = const Color(0xFF1877f2);

  final facebookTextColor = const Color(0xFFFFFFFF);

  final Color googleBackground;

  final Color googleButtonText;

//otp colors
  final Color pinBgColor = const Color(0xE5EEEEEE);

  final Color pinBgDisabledColor = const Color(0xFF9D9D9D);

  final pinBgSuccessColor = const Color.fromRGBO(102, 240, 174, .5);

  final Color pinSuccessBorderColor = Colors.green;

  final pinErrorBorderColor = Colors.red;

  final pinBgSubmittedColor = const Color.fromRGBO(222, 231, 240, .7);

  ///
}
