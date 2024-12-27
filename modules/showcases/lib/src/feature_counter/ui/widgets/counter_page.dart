// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:shared/shared.dart';
import 'package:user/user.dart';

import '../blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: customAppBar(
          context,
          actions: [
            RxLoadingBuilder<CounterBlocType>(
              state: (bloc) => bloc.states.isLoading,
              builder: (context, isLoading, tag, bloc) => UpdateButton(
                key: K.counterReload,
                isActive: !isLoading,
                onPressed: () => bloc.events.reload(),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RxBlocBuilder<CounterBlocType, int>(
                state: (bloc) => bloc.states.count,
                builder: (context, countState, bloc) =>
                    _buildCount(context, countState),
              ),
              AppErrorModalWidget<CounterBlocType>(
                key: K.counterError,
                errorState: (bloc) => bloc.states.errors,
              ),
              AppErrorModalWidget<UserAccountBlocType>(
                errorState: (bloc) => bloc.states.errors,
              ),
            ],
          ),
        ),
        floatingActionButton: _buildActionButtons(context),
      );

  Widget _buildCount(BuildContext context, AsyncSnapshot<int> snapshot) =>
      snapshot.hasData
          ? Text(
              snapshot.data!.toString(),
              key: K.counterCount,
              style: context.designSystem.typography.counterText,
            )
          : Text(
              snapshot.connectionState.toString(),
              style: context.designSystem.typography.h2Med16,
            );

  Widget _buildActionButtons(BuildContext context) =>
      RxLoadingBuilder<CounterBlocType>(
        state: (bloc) => bloc.states.isLoading,
        builder: (context, isLoading, tag, bloc) => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButton(
              floatingActionButtonKey: K.counterIncrement,
              appLoadingIndicatorKey: K.appLoadingIndicatorIncrement,
              icon: Icon(context.designSystem.icons.plusSign),
              tooltip: context.l10n.featureCounter.increment,
              onPressed: isLoading ? null : bloc.events.increment,
              loading: isLoading && tag == CounterBloc.tagIncrement,
              heroTag: 'increment',
            ),
            SizedBox(width: context.designSystem.spacing.m),
            ActionButton(
              floatingActionButtonKey: K.counterDecrement,
              appLoadingIndicatorKey: K.appLoadingIndicatorDecrement,
              icon: Icon(context.designSystem.icons.minusSign),
              tooltip: context.l10n.featureCounter.decrement,
              onPressed: isLoading ? null : bloc.events.decrement,
              loading: isLoading && tag == CounterBloc.tagDecrement,
              heroTag: 'decrement',
            ),
          ],
        ),
      );
}
