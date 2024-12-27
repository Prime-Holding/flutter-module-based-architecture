// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../ui/blocs/login_bloc.dart';
import '../../domain/services/login_validator_service.dart';
import '../../ui/widgets/login_page.dart';

class LoginPageWithDependencies extends StatelessWidget {
  const LoginPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
          ..._blocs,
        ],
        child: const LoginPage(),
      );

  List<SingleChildWidget> get _services => [
        Provider<LoginValidatorService>(
          create: (context) => const LoginValidatorService(),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<LoginBlocType>(
          create: (context) => LoginBloc(
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
      ];
}
