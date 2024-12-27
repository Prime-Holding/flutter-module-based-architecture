// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:shared/shared.dart';
import 'package:showcases/src/feature_counter/ui/blocs/counter_bloc.dart';
import '../../../../../shared/test/helpers/golden_helper.dart';
import '../../../../../shared/test/helpers/models/scenario.dart';
import 'factories/counter_page_factory.dart';

void main() {
  group(
    'CounterPage golden tests',
    () => runGoldenTests(
      [
        generateDeviceBuilder(
          scenario: Scenario(name: 'counter'),
          widget: counterPageFactory(
            count: 2,
            isLoggedIn: true,
            isLoading: LoadingWithTag(
              loading: false,
              tag: CounterBloc.tagIncrement,
            ),
          ),
        ),
        generateDeviceBuilder(
          scenario: Scenario(name: 'error'),
          widget: counterPageFactory(
            count: 2,
            error: NetworkErrorModel(),
            isLoggedIn: false,
          ),
        ),
        generateDeviceBuilder(
          scenario: Scenario(name: 'loading'),
          widget: counterPageFactory(
            count: 2,
            isLoggedIn: false,
            isLoading: LoadingWithTag(
              loading: true,
              tag: CounterBloc.tagIncrement,
            ),
          ),
        ),
      ],
    ),
  );
}
