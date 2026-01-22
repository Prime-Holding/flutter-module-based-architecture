// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

class SplashService {
  SplashService(
    PermissionsService permissionsService,
  ) : _permissionsService = permissionsService;

  final PermissionsService _permissionsService;

  bool _appInitialized = false;

  Future<void> initializeApp() async {
    await Future.wait(_nomenclatures);

    _appInitialized = true;
  }

  List<Future<void>> get _nomenclatures => [
        _permissionsService.load(),
      ];

  bool get isAppInitialized => _appInitialized;
}
