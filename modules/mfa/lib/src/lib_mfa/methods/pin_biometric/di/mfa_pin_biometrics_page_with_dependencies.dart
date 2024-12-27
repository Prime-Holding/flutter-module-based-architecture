// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../domain/models/mfa_response.dart';
import '../domain/services/mfa_pincode_service.dart';
import '../ui/widgets/mfa_pin_biometrics_page.dart';

class MfaPinBiometricsPageWithDependencies extends StatelessWidget {
  const MfaPinBiometricsPageWithDependencies({
    required this.transactionId,
    required this.mfaResponse,
    super.key,
  });

  final MfaResponse mfaResponse;
  final String transactionId;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
        ],
        child: MfaPinBiometricsPage(
          transactionId: transactionId,
        ),
      );

  List<SingleChildStatelessWidget> get _services => [
        Provider<MfaPinCodeService>(
          create: (context) => MfaPinCodeService(
            mfaResponse: mfaResponse,
            mfaRepository: context.read(),
          ),
        ),
      ];
}
