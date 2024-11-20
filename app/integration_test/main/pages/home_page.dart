// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

import '../base/base_page.dart';
import '../configuration/build_app.dart';
import 'profile_page.dart';

class HomePage extends BasePage {
  HomePage(super.$);

  PatrolFinder get locBtnCounterPage => $(Icons.calculate);
  PatrolFinder get locBtnProfilePage => $(Icons.account_box);

  Future<void> tapBtnCounterPage() async {
    await $(locBtnCounterPage).tap();
    await $.pumpAndSettle();
  }

  Future<ProfilePage> tapBtnProfilePage() async {
    await $(locBtnProfilePage).tap();
    await $.pumpAndSettle();
    return ProfilePage($);
  }
}
