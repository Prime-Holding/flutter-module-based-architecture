// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../../extensions/error_model_extensions.dart';
import '../../../extensions/error_model_translations.dart';
import '../../../l10n/l10n.dart';

import '../../domain/models/pin_code_arguments.dart';
import '../../domain/services/update_pin_code_service.dart';
import '../bloc/update_and_verify_pin_bloc.dart';

class UpdatePinPage extends StatelessWidget {
  const UpdatePinPage({
    this.pinCodeArguments = const PinCodeArguments(title: ''),
    super.key,
  });

  final PinCodeArguments pinCodeArguments;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, dynamic) =>
            context.read<UpdateAndVerifyPinBlocType>().events.deleteSavedData(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              pinCodeArguments.title.isEmpty
                  ? context.l10n.libPinCode.updatePinPage
                  : pinCodeArguments.title,
            ),
            forceMaterialTransparency: true,
          ),
          extendBodyBehindAppBar: true,
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Expanded(
                  child: PinCodeKeyboard(
                    mapBiometricMessageToString: (message) =>
                        _exampleMapMessageToString(message, context),
                    pinCodeService: context.read<UpdatePinCodeService>(),
                    biometricsLocalDataSource:
                        pinCodeArguments.showBiometricsButton
                            ? context.read<BiometricsLocalDataSource>()
                            : null,
                    biometricsAuthDataSource:
                        context.read<PinBiometricsAuthDataSource?>(),
                    translateError: (error) =>
                        error.asErrorModel().translate(context),
                    onAuthenticated: (token) =>
                        _isPinCodeVerified(context, token),
                  ),
                ),
                RxBlocListener<UpdateAndVerifyPinBlocType, void>(
                  state: (bloc) => bloc.states.isPinUpdated,
                  listener: (context, isCreated) {
                    //TODO: Implement the logic to navigate to the next screen
                    // context
                    //     .read<RouterBlocType>()
                    //     .events
                    //     .go(const ProfileRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _isPinCodeVerified(
    BuildContext context,
    String? updateToken,
  ) async {
    if (pinCodeArguments.title == context.l10n.libPinCode.enterCurrentPin) {
      //TODO: Implement the logic to navigate to the next screen
      // return context
      //     .read<RouterBlocType>()
      //     .events
      //     .pushReplace(const UpdatePinRoute(),
      //         extra: PinCodeArguments(
      //           title: context.l10n.libPinCode.enterNewPin,
      //           updateToken: updateToken,
      //         ));
    }
    if (pinCodeArguments.title == context.l10n.libPinCode.enterNewPin) {
      //TODO: Implement the logic to navigate to the next screen
      // return context
      //     .read<RouterBlocType>()
      //     .events
      //     .pushReplace(const UpdatePinRoute(),
      //         extra: PinCodeArguments(
      //           title: context.l10n.libPinCode.confirmPin,
      //           updateToken: pinCodeArguments.updateToken ?? updateToken,
      //         ));
    } else if (pinCodeArguments.title == context.l10n.libPinCode.confirmPin) {
      context.read<UpdateAndVerifyPinBlocType>().events.checkIsPinUpdated();
    }
  }

  String _exampleMapMessageToString(
      BiometricsMessage message, BuildContext context) {
    switch (message) {
      case BiometricsMessage.notSetup:
        return context.l10n.libPinCode.biometricsNotSetup;

      case BiometricsMessage.notSupported:
        return context.l10n.libPinCode.biometricsNotSupported;

      case BiometricsMessage.enabled:
        return context.l10n.libPinCode.biometricsEnabled;

      case BiometricsMessage.disabled:
        return context.l10n.libPinCode.biometricsDisabled;
    }
  }
}
