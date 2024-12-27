// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import 'ui/app/initialization/app_setup.dart';
import 'ui/app/melostest.dart';

/// Main entry point for the SIT environment
void main() async => await setupAndRunApp(
      (config) => Melostest(
        config: config,
      ),
      environment: EnvironmentConfig.sit,
    );
