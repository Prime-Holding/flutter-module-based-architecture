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

import '../../ui/blocs/enter_message_bloc.dart';
import '../../domain/services/enter_message_field_service.dart';
import '../widgets/enter_message_page.dart';

class EnterMessageWithDependencies extends StatelessWidget {
  const EnterMessageWithDependencies({super.key});

  List<SingleChildWidget> get _services => [
        Provider<EnterMessageFieldService>(
          create: (context) => EnterMessageFieldService(),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<EnterMessageBlocType>(
          create: (context) => EnterMessageBloc(),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
          ..._blocs,
        ],
        child: const EnterMessagePage(),
      );
}
