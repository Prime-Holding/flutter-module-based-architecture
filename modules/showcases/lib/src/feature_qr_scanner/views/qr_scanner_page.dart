// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

import '../services/qr_service.dart';

class QrScannerPage extends StatelessWidget {
  const QrScannerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.featureQr.qrCodePageTitle),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widgetToolkitTheme.spacingXXXXL,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrScannerWidget<String>(
                qrValidationService: QrService(),
                onCodeValidated: (result) => showBlurredBottomSheet(
                  context: context,
                  builder: (ctx) => MessagePanelWidget(
                    message: result ?? '',
                    messageState: MessagePanelState.positiveCheck,
                  ),
                ),
                onError: (error) => showErrorBlurredBottomSheet(
                  context: context,
                  error: error.toString(),
                  configuration:
                      const ModalConfiguration(showCloseButton: true),
                ),
              ),
            ],
          ),
        ),
      );
}
