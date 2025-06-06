// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:melostest/main_development.dart' as app_dev;
import 'package:melostest/main_production.dart' as app;
import 'package:melostest/main_sit.dart' as app_sit;
import 'package:melostest/main_uat.dart' as app_uat;
import 'package:patrol/patrol.dart';

export 'package:flutter/foundation.dart';
export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

const String env = String.fromEnvironment('flavor');

class BuildApp {
  late PatrolIntegrationTester $;

  BuildApp(this.$);

  Future<void> buildApp() async {
    final FlutterExceptionHandler? originalOnError = FlutterError.onError;

    /// The next row have to be manually modified with another relevant suffix
    /// if a different flavor will be used for testing
    switch (env) {
      case 'development':
        app_dev.main();
        break;
      case 'sit':
        app_sit.main();
        break;
      case 'uat':
        app_uat.main();
        break;
      default:
        app.main();
    }
    await $.pumpAndSettle();
    FlutterError.onError = originalOnError;
  }
}
