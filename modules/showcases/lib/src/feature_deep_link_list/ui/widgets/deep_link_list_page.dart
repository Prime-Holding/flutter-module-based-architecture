// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/routes.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart' hide ErrorModel;

import '../../../domain/models/deep_link_model.dart';

import '../blocs/deep_link_list_bloc.dart';
import 'components/enter_message_button.dart';

class DeepLinkListPage extends StatelessWidget {
  const DeepLinkListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: customAppBar(
          context,
          title: context.l10n.featureDeepLink.deepLinkFlowPageTitle,
          actions: [
            RxLoadingBuilder<DeepLinkListBlocType>(
              state: (bloc) => bloc.states.isLoading,
              builder: (context, isLoading, tag, bloc) => EnterMessageButton(
                isActive: !isLoading,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppErrorModalWidget<DeepLinkListBlocType>(
              errorState: (bloc) => bloc.states.errors,
            ),
            RxBlocListener<DeepLinkListBlocType, String>(
              state: (bloc) => bloc.states.message,
              condition: (old, current) =>
                  (old != current && current.isNotEmpty),
              listener: _onMessageReceived,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                  context.designSystem.spacing.m,
                ),
                child:
                    RxResultBuilder<DeepLinkListBlocType, List<DeepLinkModel>>(
                  state: (bloc) => bloc.states.deepLinkList,
                  buildError: (ctx, error, bloc) => AppErrorWidget(
                    errorText: (error as ErrorModel).translate(context),
                    onTabRetryText: context.l10n.tryAgain,
                    onTabRetry: () => bloc.events.fetchDeepLinkList(),
                  ),
                  buildLoading: (ctx, bloc) => Center(
                    child: AppLoadingIndicator.taskValue(context),
                  ),
                  buildSuccess: (ctx, items, bloc) => ListView.separated(
                    padding: EdgeInsets.all(
                      context.designSystem.spacing.xs,
                    ),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        OutlineFillButton(
                      text: items[index].name,
                      onPressed: () =>
                          context.read<RouterBlocType>().events.push(
                                DeepLinkDetailsRoute(id: items[index].id),
                                extra: items[index],
                              ),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: context.designSystem.spacing.l,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void _onMessageReceived(
    BuildContext context,
    String message,
  ) =>
      showBlurredBottomSheet(
        // TODO: Fix this
        //  context: AppRouter.rootNavigatorKey.currentContext ?? context,
        context: context,
        builder: (BuildContext context) => MessagePanelWidget(
          message: message,
          messageState: MessagePanelState.informative,
        ),
      );
}
