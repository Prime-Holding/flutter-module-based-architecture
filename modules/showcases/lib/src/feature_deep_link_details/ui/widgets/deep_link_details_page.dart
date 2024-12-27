// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:shared/shared.dart';

import '../../../domain/models/deep_link_model.dart';
import '../blocs/deep_link_details_bloc.dart';

class DeepLinkDetailsPage extends StatelessWidget {
  const DeepLinkDetailsPage({
    required this.deepLinkId,
    super.key,
  });

  final String deepLinkId;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: _appBarTitle(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppErrorModalWidget<DeepLinkDetailsBlocType>(
              errorState: (bloc) => bloc.states.errors,
            ),
            Expanded(
              child: Center(
                child: RxResultBuilder<DeepLinkDetailsBlocType, DeepLinkModel>(
                  state: (bloc) => bloc.states.deepLink,
                  buildSuccess: (ctx, itemData, bloc) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        itemData.description,
                        style: context.designSystem.typography.h1Reg20,
                      ),
                    ],
                  ),
                  buildError: (context, error, bloc) => AppErrorWidget(
                    onTabRetry: () =>
                        bloc.events.fetchDeepLinkDetailsById(deepLinkId),
                    errorText: (error as ErrorModel).translate(context),
                    onTabRetryText: context.l10n.tryAgain,
                  ),
                  buildLoading: (context, bloc) =>
                      AppLoadingIndicator.taskValue(context),
                ),
              ),
            )
          ],
        ),
      );

  Widget _appBarTitle() =>
      RxResultBuilder<DeepLinkDetailsBlocType, DeepLinkModel>(
        state: (bloc) => bloc.states.deepLink,
        buildSuccess: (ctx, itemData, bloc) => Text(itemData.name),
        buildError: (context, error, bloc) => Text(context.l10n.errorState),
        buildLoading: (context, bloc) => Text(context.l10n.loadingState),
      );
}
