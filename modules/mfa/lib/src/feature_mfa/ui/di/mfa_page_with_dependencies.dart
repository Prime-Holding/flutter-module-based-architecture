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

import '../blocs/mfa_edit_address_bloc.dart';
import '../../domain/services/mfa_edit_address_service.dart';

import '../widgets/mfa_page.dart';

class MfaPageWithDependencies extends StatelessWidget {
  const MfaPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
          ..._blocs,
        ],
        child: const MfaPage(),
      );

  List<SingleChildWidget> get _services => [
        Provider<MfaEditAddressService>(
          create: (context) => MfaEditAddressService(),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<MfaEditAddressBlocType>(
          create: (context) => MfaEditAddressBloc(
            context.read(),
          ),
        )
      ];
}
