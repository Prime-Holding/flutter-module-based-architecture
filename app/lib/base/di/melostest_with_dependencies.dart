// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa/dependencies.dart' as mfa;
import 'package:notifications/dependencies.dart' as notifications;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared/dependencies.dart' as shared;
import 'package:shared/shared.dart';
import 'package:showcases/dependencies.dart' as showcases;
import 'package:user/dependencies.dart' as user;

import '../../feature_splash/services/splash_service.dart';
import '../../lib_router/router.dart';
import '../../lib_router/services/route_resolver_service.dart';

class MelostestWithDependencies extends StatelessWidget {
  const MelostestWithDependencies({
    required this.config,
    required this.child,
    super.key,
  });

  final EnvironmentConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
        /// List of all providers used throughout the app
        providers: [
          ..._coordinator,
          ..._appRouter,
          ..._environment,
          ...shared.dependencies(config),
          ...notifications.dependencies,
          ...user.dependencies,
          ...mfa.dependencies,
          ...showcases.dependencies,
          ..._services,
        ],
        child: child,
      );

  List<SingleChildWidget> get _coordinator => [
        RxBlocProvider<CoordinatorBlocType>(
          create: (context) => CoordinatorBloc(),
        ),
      ];

  List<SingleChildWidget> get _appRouter => [
        Provider<AppRouter>(
          create: (context) => AppRouter(
            coordinatorBloc: context.read(),
          ),
        ),
        Provider<RouterResolverService>(
          create: (context) => RouteResolverService(),
        ),
        Provider<GoRouter>(
          create: (context) => context.read<AppRouter>().router,
        ),
        //router
      ];

  List<Provider> get _environment => [
        // Provider<EnvironmentConfig>.value(value: config),
      ];

  List<Provider> get _services => [
        Provider<SplashService>(
          create: (context) => SplashService(
            context.read(),
            context.read(),
          ),
        ),
      ];
}
