// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../base/base_page.dart';
import '../configuration/build_app.dart';

class CounterPage extends BasePage {
  CounterPage(super.$);

  PatrolFinder get locCountText => $(K.counterCount);
  PatrolFinder get locBtnError => $(SmallButton);

  Future<void> tapBtnIncrement() async {
    await $(K.counterIncrement).tap(settlePolicy: SettlePolicy.noSettle);
  }

  Future<void> tapBtnDecrement() async {
    await $(K.counterDecrement).tap(settlePolicy: SettlePolicy.noSettle);
  }

  Future<void> tapBtnReload() async {
    await $(K.counterReload).tap();
  }

  Future<bool> isSpinnerIncrementDisplayed() async {
    return isVisible($(K.appLoadingIndicatorIncrement));
  }

  Future<bool> isSpinnerDecrementDisplayed() async {
    return isVisible($(K.appLoadingIndicatorDecrement));
  }

  Future<bool> isTextCountDisplayed() async {
    return isVisible($(locCountText));
  }

  Future<bool> isModalErrorDisplayed() async {
    return isDisplayed($(K.counterError));
  }

  Future<int> getCounterValue() async {
    return int.parse($(locCountText).text!);
  }

  Future<void> tapBtnError() async {
    await $(locBtnError).tap();
  }
}
