// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

class PinCodeArguments {
  const PinCodeArguments({
    required this.title,
    this.onReturn,
    this.showBiometricsButton = false,
    this.updateToken,
  });

  final String title;
  final Function? onReturn;
  final bool showBiometricsButton;
  final String? updateToken;
}
