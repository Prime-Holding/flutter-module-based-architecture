// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

import '../base/base_page.dart';
import '../configuration/build_app.dart';

class ProfilePage extends BasePage {
  ProfilePage(super.$);

  final Finder locBtnLogout = find.byIcon(Icons.logout);

  Future<void> tapBtnLogout() async {
    await $(locBtnLogout).tap();
  }
}
