import 'dart:async';

import '../../../shared/test/flutter_test_config.dart' as shared;

Future<void> testExecutable(FutureOr<void> Function() testMain) async =>
    shared.testExecutable(testMain);
