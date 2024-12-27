// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../l10n/l10n.dart';
import '../../domain/models/pin_code_arguments.dart';
import '../../domain/services/update_pin_code_service.dart';
import '../widgets/update_pin_page.dart';

class UpdatePinPageWithDependencies extends StatelessWidget {
  const UpdatePinPageWithDependencies({
    required this.pinCodeArguments,
    super.key,
  });

  final PinCodeArguments pinCodeArguments;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services(context),
        ],
        child: UpdatePinPage(
          pinCodeArguments: pinCodeArguments,
        ),
      );

  List<SingleChildStatelessWidget> _services(BuildContext context) => [
        Provider<UpdatePinCodeService>(
          create: (_) => UpdatePinCodeService(
            context.read(),
            token: pinCodeArguments.updateToken,
            isVerificationPinProcess: pinCodeArguments.title ==
                context.l10n.libPinCode.enterCurrentPin,
          ),
        ),
      ];
}
