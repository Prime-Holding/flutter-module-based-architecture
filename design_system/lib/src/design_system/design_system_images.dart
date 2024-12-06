// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

@immutable
class DesignSystemImages {
  const DesignSystemImages.dark()
      : googleLogo = 'packages/assets/images/google_dark_icon.svg';
  const DesignSystemImages.light()
      : googleLogo = 'packages/assets/images/google_light_icon.svg';

  final testImage = const AssetImage(
    'images/testImage.png',
    package: 'shared',
  );

  final String googleLogo;

  final String appleLogo = 'packages/assets/images/apple_icon.svg';

  final String facebookLogo = 'packages/assets/images/facebook_icon.svg';
}
