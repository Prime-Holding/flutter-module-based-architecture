// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:shared/shared.dart';
import 'package:showcases/src/feature_counter/blocs/counter_bloc.dart';
import 'package:showcases/src/feature_counter/views/counter_page.dart';
import 'package:user/user.dart';

import '../../../../../../shared/test/blocs/router_bloc_mock.dart';
import '../../../../../user/test/blocs/user_account_bloc_mock.dart';
import '../../mocks/counter_bloc_mock.dart';

/// wraps a [CounterPage] in a [Provider] of type [CounterBlocType], creating
/// a mocked bloc depending on the values being tested
Widget counterPageFactory({
  required bool isLoggedIn,
  ErrorModel? error,
  int? count,
  LoadingWithTag? isLoading,
}) =>
    MultiProvider(
      providers: [
        RxBlocProvider<RouterBlocType>.value(
          value: routerBlocMockFactory(),
        ),
        RxBlocProvider<CounterBlocType>.value(
          value: counterBlocMockFactory(
            count: count,
            error: error,
            isLoading: isLoading,
          ),
        ),
        RxBlocProvider<UserAccountBlocType>.value(
          value: userAccountBlocMockFactory(loggedIn: isLoggedIn),
        ),
      ],
      child: const CounterPage(),
    );
