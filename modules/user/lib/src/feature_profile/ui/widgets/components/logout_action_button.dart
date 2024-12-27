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
import 'package:shared/shared.dart';

import '../../../../lib_auth/ui/blocs/user_account_bloc.dart';

class LogoutActionButton extends StatelessWidget {
  const LogoutActionButton({super.key});

  @override
  Widget build(BuildContext context) =>
      RxBlocBuilder<UserAccountBlocType, bool>(
        state: (bloc) => bloc.states.isLoading,
        builder: (context, loading, bloc) => loading.isLoading
            ? Padding(
                padding: EdgeInsets.all(
                  context.designSystem.spacing.m,
                ),
                child: AppLoadingIndicator.textButtonValue(
                  context,
                  color: context.designSystem.colors.backgroundColor,
                ),
              )
            : IconButton(
                icon: context.designSystem.icons.logoutIcon,
                onPressed: () =>
                    context.read<UserAccountBlocType>().events.logout(),
              ),
      );
}
