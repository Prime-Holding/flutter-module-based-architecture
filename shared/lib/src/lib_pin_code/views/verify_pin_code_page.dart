// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../extensions/error_model_translations.dart';
import '../../extensions/error_model_extensions.dart';

import '../../blocs/coordinator_bloc.dart';
import '../../l10n/l10n.dart';
import '../bloc/update_and_verify_pin_bloc.dart';
import '../models/pin_code_arguments.dart';
import '../services/verify_pin_code_service.dart';

class VerifyPinCodePage extends StatelessWidget {
  const VerifyPinCodePage({
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
                  ? context.l10n.libPinCode.verifyPinCodePage
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
                    pinCodeService: context.read<VerifyPinCodeService>(),
// Comment the line bellow in order not to use biometrics
// authentication
                    biometricsLocalDataSource:
                        context.read<BiometricsLocalDataSource>(),
                    biometricsAuthDataSource:
                        context.read<PinBiometricsAuthDataSource?>(),
                    translateError: (error) =>
                        error.asErrorModel().translate(context),
                    onAuthenticated: (_) => _isPinCodeVerified(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _isPinCodeVerified(BuildContext context) async {
    context.read<CoordinatorBlocType>().events.pinCodeConfirmed(
          isPinCodeConfirmed: true,
        );
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
