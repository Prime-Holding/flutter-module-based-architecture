// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:design_system/design_system.dart';

import '../../../lib_mfa/domain/models/mfa_action.dart';
import '../blocs/mfa_edit_address_bloc.dart';
import '../../domain/services/mfa_edit_address_service.dart';

class MfaPage extends StatelessWidget {
  const MfaPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.featureMfa.appBarTitle),
        ),
        body: Padding(
          padding: EdgeInsets.all(context.designSystem.spacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppErrorModalWidget<MfaEditAddressBlocType>(
                errorState: (bloc) => bloc.states.error,
              ),
              RxBlocListener<MfaEditAddressBlocType, MfaAction>(
                state: (bloc) => bloc.states.onMfaCompleted,
                listener: _showMfaComplete,
              ),
              Text(
                context.l10n.featureMfa.changeAddressActionTitle,
                style: context.designSystem.typography.h2Med16,
              ),
              SizedBox(height: context.designSystem.spacing.m),
              EditAddressWidget<CountryModel>(
                translateError: (error) =>
                    ErrorModelFieldL10n.translateError<String>(error, context),
                service: context.read<MfaEditAddressService>(),
                onSaved: (address) {
                  context.read<MfaEditAddressBlocType>().events.saveAddress(
                        city: address.city,
                        streetAddress: address.streetAddress,
                        countryCode: address.country.countryCode,
                      );
                },
              ),
              Text(
                context.l10n.featureMfa.changeAddressActionDescription,
                style: context.designSystem.typography.h3Med11,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.designSystem.spacing.m,
                ),
                child: const Divider(),
              ),
              Text(
                context.l10n.featureMfa.unlockActionTitle,
                style: context.designSystem.typography.h2Med16,
              ),
              Center(
                child: PrimaryButton(
                  child: Text(context.l10n.featureMfa.unlockButtonText),
                  onPressed: () =>
                      context.read<MfaEditAddressBlocType>().events.unlock(),
                ),
              ),
              SizedBox(height: context.designSystem.spacing.m),
              Text(
                context.l10n.featureMfa.unlockActionDescription,
                style: context.designSystem.typography.h3Med11,
              ),
            ],
          ),
        ),
      );

  void _showMfaComplete(BuildContext context, MfaAction action) =>
      showBlurredBottomSheet(
        context: context,
        builder: (BuildContext context) => MessagePanelWidget(
          message: action.name,
          messageState: MessagePanelState.positive,
        ),
      );
}
