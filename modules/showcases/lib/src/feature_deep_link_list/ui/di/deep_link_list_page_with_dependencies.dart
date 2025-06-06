// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/deep_link_list_bloc.dart';
import '../widgets/deep_link_list_page.dart';

class DeepLinkListPageWithDependencies extends StatelessWidget {
  const DeepLinkListPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._blocs,
        ],
        child: const DeepLinkListPage(),
      );

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<DeepLinkListBlocType>(
          create: (context) => DeepLinkListBloc(context.read()),
        ),
      ];
}
