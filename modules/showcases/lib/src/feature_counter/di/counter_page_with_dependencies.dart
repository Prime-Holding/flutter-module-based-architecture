// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:showcases/src/base/repositories/counter_repository.dart';

import '../../base/data_sources/remote/count_remote_data_source.dart';
import '../blocs/counter_bloc.dart';
import '../services/counter_service.dart';
import '../views/counter_page.dart';

class CounterPageWithDependencies extends StatelessWidget {
  const CounterPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._dataSources,
          ..._repositories,
          ..._services,
          ..._blocs,
        ],
        child: const CounterPage(),
      );

  List<Provider> get _dataSources => [
        Provider<CountRemoteDataSource>(
          create: (context) => CountRemoteDataSource(
            context.read<ApiHttpClient>(),
          ),
        ),
      ];

  List<Provider> get _repositories => [
        Provider<CounterRepository>(
          create: (context) => CounterRepository(
            context.read(),
            context.read(),
          ),
        ),
      ];

  List<Provider> get _services => [
        Provider<CounterService>(
          create: (context) => CounterService(
            context.read(),
          ),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<CounterBlocType>(
          create: (context) => CounterBloc(
            context.read(),
          ),
        ),
      ];
}
