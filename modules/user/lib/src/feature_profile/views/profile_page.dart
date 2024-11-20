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
import 'package:shared/routes.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../blocs/profile_bloc.dart';
import '../extensions/push_notifications_extensions.dart';
import '../ui_components/logout_action_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBlocType>().events.loadNotificationsSettings();
    context.read<CreatePinBlocType>().events.checkIsPinCreated();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [
            LogoutActionButton(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.designSystem.spacing.xl0,
              ),
              child: OutlineFillButton(
                text: context.l10n.featureNotifications.notificationPageTitle,
                onPressed: () {
                  context
                      .read<RouterBlocType>()
                      .events
                      .push(NotificationsRoute());
                },
              ),
            ),
            SizedBox(
              height: context.designSystem.spacing.xl0,
            ),
            LanguagePickerButton(
              padding: context.designSystem.spacing.xl0,
              buttonText:
                  context.l10n.featureProfile.profilePageChangeLanguageButton,
              translate: (model) => model.asText(context),
            ),
            SizedBox(
              height: context.designSystem.spacing.xl0,
            ),
            RxBlocBuilder<CreatePinBlocType, bool>(
              state: (bloc) => bloc.states.isPinCreated,
              builder: (context, isPinCreated, bloc) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.designSystem.spacing.xl0,
                ),
                child: OutlineFillButton(
                  text: _buildPinButtonText(isPinCreated, context),
                  onPressed: () {
                    if (isPinCreated.hasData && isPinCreated.data!) {
                      context
                          .read<UpdateAndVerifyPinBlocType>()
                          .events
                          .deleteSavedData();

                      // TODO: Fix routing
                      context.read<RouterBlocType>().events.push(
                            UpdatePinRoute(),
                            extra: PinCodeArguments(
                                title: context.l10n.libPinCode.enterCurrentPin),
                          );
                    } else {
                      context
                          .read<CreatePinBlocType>()
                          .events
                          .deleteSavedData();
                      context.read<RouterBlocType>().events.push(
                            CreatePinRoute(),
                            extra: PinCodeArguments(
                              title: context.l10n.libPinCode.createPin,
                            ),
                          );
                    }
                  },
                ),
              ),
            ),
            AppErrorModalWidget<ProfileBlocType>(
              errorState: (bloc) => bloc.states.errors,
            ),
            RxBlocListener<ProfileBlocType, Result<bool>>(
              state: (bloc) => bloc.states.syncNotificationsStatus,
              condition: (previous, current) => current is ResultSuccess<bool>,
              listener: (context, state) {
                if (state.tag.isLoadingSubscription) {
                  showBlurredBottomSheet(
                    context: context,
                    builder: (BuildContext context) => MessagePanelWidget(
                      message: (state as ResultSuccess<bool>)
                          .data
                          .translate(context),
                      messageState: MessagePanelState.positiveCheck,
                    ),
                  );
                }
              },
              child: const SizedBox(),
            ),
            ListTile(
              title: Text(context
                  .l10n.featureProfile.profilePageEnableNotificationText),
              trailing: RxBlocBuilder<ProfileBlocType, Result<bool>>(
                state: (bloc) => bloc.states.areNotificationsEnabled,
                builder: (context, areNotificationsEnabled, bloc) => Switch(
                  value: areNotificationsEnabled.value,
                  onChanged: (_) => bloc.events.setNotifications(
                    !areNotificationsEnabled.value,
                  ),
                ),
              ),
            ),
            RxBlocListener<CreatePinBlocType, bool>(
              state: (bloc) => bloc.states.isPinCreated,
              condition: (previous, current) =>
                  previous != current && current == true,
              listener: (context, isCreated) async {
                if (isCreated) {
                  await showBlurredBottomSheet(
                    context: context,
                    configuration:
                        const ModalConfiguration(safeAreaBottom: false),
                    builder: (context) => MessagePanelWidget(
                      message: context.l10n.libPinCode.pinCreatedMessage,
                      messageState: MessagePanelState.positiveCheck,
                    ),
                  );
                }
              },
            ),
            RxBlocListener<UpdateAndVerifyPinBlocType, void>(
              state: (bloc) => bloc.states.isPinUpdated,
              listener: (context, isCreated) async {
                await showBlurredBottomSheet(
                  context: context,
                  configuration:
                      const ModalConfiguration(safeAreaBottom: false),
                  builder: (context) => MessagePanelWidget(
                    message: context.l10n.libPinCode.pinUpdatedMessage,
                    messageState: MessagePanelState.positiveCheck,
                  ),
                );
              },
            ),
          ],
        ),
      );

  String _buildPinButtonText(
      AsyncSnapshot<bool> isPinCreated, BuildContext context) {
    if (isPinCreated.hasData) {
      if (isPinCreated.data!) {
        return context.l10n.libPinCode.changePin;
      }
      return context.l10n.libPinCode.createPin;
    }
    return context.l10n.libPinCode.createPin;
  }
}

extension _StringX on String {
  bool get isLoadingSubscription =>
      this == ProfileBloc.tagNotificationUnsubscribe ||
      this == ProfileBloc.tagNotificationSubscribe;
}
