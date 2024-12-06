// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

import '../../feature_enter_message/di/enter_message_with_dependencies.dart';
import '../blocs/deep_link_list_bloc.dart';

class EnterMessageButton extends StatelessWidget {
  const EnterMessageButton({
    required this.isActive,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () async {
          final response = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EnterMessageWithDependencies(),
            ),
          );

          if (response == null) {
            return;
          }

          if (context.mounted) {
            context.read<DeepLinkListBlocType>().events.setMessage(response);
          }
        },
        icon: Icon(
          context.designSystem.icons.message,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        tooltip: context.l10n.pageWithResult,
        color: (isActive
            ? context.designSystem.colors.activeButtonTextColor
            : context.designSystem.colors.inactiveButtonTextColor),
      );
}
