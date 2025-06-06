// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:collection/collection.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart' hide ErrorModel;

import '../../../lib_router/domain/models/routes_path.dart';
import '../../../lib_router/ui/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.currentIndex,
    required this.branchNavigators,
    required this.onNavigationItemSelected,
    super.key,
  });

  final int currentIndex;
  final List<Widget> branchNavigators;
  final void Function(int) onNavigationItemSelected;

  @override
  Widget build(BuildContext context) {
    final list = navItemsList(context);
    return Scaffold(
      body: RxBlocListener<RouterBlocType, ErrorModel>(
        state: (bloc) => bloc.states.errors,
        listener: (context, state) => _onError(context, state),
        child: BranchContainer(
          currentIndex: currentIndex,
          children: branchNavigators,
        ),
      ),
      bottomNavigationBar: list.length == 1
          ? null
          : BottomNavigationBar(
              key: K.bottomNavigationBar,
              backgroundColor: context.designSystem.colors.backgroundColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: onNavigationItemSelected,
              items: list
                  .map(
                    (item) => BottomNavigationBarItem(
                      label: item.title,
                      icon: item.icon,
                    ),
                  )
                  .toList(),
            ),
    );
  }

  List<NavMenuItem> navItemsList(BuildContext context) => [
        NavMenuItem(
          title: context.l10n.dashboard,
          icon: context.designSystem.icons.dashboard,
          route: const DashboardRoute(),
          routePath: RoutesPath.dashboard,
        ),
        NavMenuItem(
          title: context.l10n.navShowcase,
          icon: context.designSystem.icons.showcase,
          route: const ShowcaseRoute(),
          routePath: RoutesPath.showcase,
        ),
        NavMenuItem(
          title: context.l10n.navProfile,
          icon: context.designSystem.icons.accountIcon,
          route: const ProfileRoute(),
          routePath: RoutesPath.profile,
        ),
      ];

  void _onError(BuildContext context, ErrorModel errorModel) =>
      showBlurredBottomSheet(
        context: AppRouter.rootNavigatorKey.currentContext ?? context,
        builder: (BuildContext context) => MessagePanelWidget(
          message: errorModel.translate(context),
          messageState: MessagePanelState.neutral,
        ),
      );
}

class NavMenuItem {
  NavMenuItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.routePath,
  });

  final String title;
  final Icon icon;
  final RouteDataModel route;
  final String routePath;
}

class BranchContainer extends StatelessWidget {
  const BranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        final isCurrentIndex = index == currentIndex;
        return Opacity(
          opacity: isCurrentIndex ? 1 : 0,
          child: IgnorePointer(
            ignoring: !isCurrentIndex,
            child: TickerMode(
              enabled: isCurrentIndex,
              child: navigator,
            ),
          ),
        );
      },
    ).toList());
  }
}
