// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import 'base/app/initialization/app_setup.dart';
import 'base/app/melostest.dart';

/// Main entry point for the UAT environment
void main() async => await setupAndRunApp(
      (config) => Melostest(
        config: config,
      ),
      environment: EnvironmentConfig.uat,
    );
