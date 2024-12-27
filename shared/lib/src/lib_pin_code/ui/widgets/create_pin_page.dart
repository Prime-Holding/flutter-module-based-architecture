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

import '../../../../routes.dart';
import '../../../../shared.dart';
import '../../../lib_router/ui/blocs/router_bloc.dart';
import '../../domain/models/pin_code_arguments.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({
    this.pinCodeArguments = const PinCodeArguments(title: ''),
    super.key,
  });

  final PinCodeArguments pinCodeArguments;

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  @override
  void dispose() {
    if (widget.pinCodeArguments.onReturn != null) {
      widget.pinCodeArguments.onReturn!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              widget.pinCodeArguments.title.isEmpty
                  ? context.l10n.libPinCode.createPinPage
                  : widget.pinCodeArguments.title,
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
                    biometricsAuthDataSource:
                        context.read<PinBiometricsAuthDataSource?>(),
                    pinCodeService: context.read<CreatePinCodeService>(),
                    translateError: (error) =>
                        error.asErrorModel().translate(context),
                    onAuthenticated: (_) => _isPinCodeVerified(context),
                  ),
                ),
                RxBlocListener<CreatePinBlocType, bool>(
                  state: (bloc) => bloc.states.isPinCreated,
                  listener: (context, isCreated) {
                    if (isCreated) {
                      context.read<RouterBlocType>().events.go(ProfileRoute());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _isPinCodeVerified(BuildContext context) async {
    if (widget.pinCodeArguments.title == context.l10n.libPinCode.createPin) {
      // TODO: Implement the logic to navigate to the next screen
      // context.read<RouterBlocType>().events.pushReplace(
      //       const CreatePinRoute(),
      //       extra: PinCodeArguments(
      //         title: context.l10n.libPinCode.confirmPin,
      //         onReturn:
      //             context.read<CreatePinBlocType>().events.checkIsPinCreated,
      //       ),
      //     );
    } else if (widget.pinCodeArguments.title ==
        context.l10n.libPinCode.confirmPin) {
      context.read<CreatePinBlocType>().events.checkIsPinCreated();
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
