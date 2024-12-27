// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/deep_link_model.dart';
import '../blocs/deep_link_details_bloc.dart';
import '../widgets/deep_link_details_page.dart';

class DeepLinkDetailsWithDependencies extends StatelessWidget {
  const DeepLinkDetailsWithDependencies({
    required this.deepLinkId,
    this.deepLink,
    super.key,
  });

  final String deepLinkId;
  final DeepLinkModel? deepLink;

  // DeepLinkService
  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<DeepLinkDetailsBlocType>(
          create: (context) => DeepLinkDetailsBloc(
            context.read(),
            deepLinkId: deepLinkId,
            deepLink: deepLink,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        key: ValueKey(
          _BlocValueKey(
            deepLinkId: deepLinkId,
            deepLink: deepLink,
            blocName: 'DeepLinkDetailsBloc',
          ),
        ),
        providers: [
          ..._blocs,
        ],
        child: DeepLinkDetailsPage(
          deepLinkId: deepLinkId,
        ),
      );
}

class _BlocValueKey with EquatableMixin {
  _BlocValueKey({
    required this.deepLinkId,
    this.deepLink,
    this.blocName,
  });

  final DeepLinkModel? deepLink;
  final String deepLinkId;
  final String? blocName;

  @override
  List<Object?> get props => [deepLink, deepLinkId, blocName];
}
