import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async =>
    GoldenToolkit.runWithConfiguration(
      () async {
        WidgetsApp.debugAllowBannerOverride = false;

        await loadAppFonts();

        return testMain();
      },
      config: GoldenToolkitConfiguration(
        enableRealShadows: true,
      ),
    );
