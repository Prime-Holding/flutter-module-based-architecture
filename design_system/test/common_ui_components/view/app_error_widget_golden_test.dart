import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../helpers/golden_helper.dart';

void main() {
  runGoldenBuilderTests('app_error',
      surfaceSize: const Size(345, 174),
      builder: (color) => GoldenBuilder.column(bgColor: color)
        ..addScenario(
          'unknown error',
          AppErrorWidget(
            onTabRetry: () {},
            errorText: 'Oops, something went wrong. Please try again.',
            onTabRetryText: 'Try again',
          ),
        ));
}
