// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../configuration/build_app.dart';
import '../pages/home_page.dart';

class HomePageSteps {
  static Future<void> navigateToCounterPage(PatrolIntegrationTester $) async {
    HomePage homePage = HomePage($);
    await homePage.tapBtnCounterPage();
    // TODO: Implement steps here
  }
}
