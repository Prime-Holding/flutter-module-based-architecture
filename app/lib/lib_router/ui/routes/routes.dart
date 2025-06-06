part of '../router.dart';

@TypedGoRoute<SplashRoute>(path: RoutesPath.splash)
@immutable
class SplashRoute extends GoRouteData implements RouteDataModel {
  const SplashRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: SplashPageWithDependencies(
          redirectToLocation: state.uri.queryParameters['from'],
        ),
      );

  @override
  String get permissionName => RouteModel.splash.permissionName;

  @override
  String get routeLocation => location;
}

@TypedStatefulShellRoute<HomeStatefulShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<DashboardBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DashboardRoute>(path: RoutesPath.dashboard),
      ],
    ),
    TypedStatefulShellBranch<ShowcaseBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ShowcaseRoute>(
          path: RoutesPath.showcase,
          routes: [
            /// Counter route
            TypedGoRoute<CounterRoute>(
              path: RoutesPath.counter,
            ),

            /// Widget toolkit route
            TypedGoRoute<WidgetToolkitRoute>(
              path: RoutesPath.widgetToolkit,
            ),

            /// QR code route
            TypedGoRoute<QrCodeRoute>(
              path: RoutesPath.qrCode,
            ),

            /// Deeplink routes
            TypedGoRoute<DeepLinksRoute>(
              path: RoutesPath.deepLinks,
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<DeepLinkDetailsRoute>(
                  path: RoutesPath.deepLinkDetails,
                ),
                TypedGoRoute<EnterMessageRoute>(
                  path: RoutesPath.enterMessage,
                ),
              ],
            ),

            /// MFA routes
            TypedGoRoute<FeatureMfaRoute>(
              path: RoutesPath.mfa,
            ),

            /// OTP route
            TypedGoRoute<FeatureOtpRoute>(
              path: RoutesPath.showcaseOtp,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(
          path: RoutesPath.profile,
          routes: [
            TypedGoRoute<NotificationsRoute>(
              path: RoutesPath.notifications,
            ),
            TypedGoRoute<CreatePinRoute>(
              path: RoutesPath.createPin,
            ),
            TypedGoRoute<UpdatePinRoute>(
              path: RoutesPath.updatePin,
            ),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class HomeStatefulShellRoute extends StatefulShellRouteData {
  const HomeStatefulShellRoute();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) =>
      MaterialPage(
        key: state.pageKey,
        child: navigationShell,
      );

  static Widget $navigatorContainerBuilder(BuildContext context,
          StatefulNavigationShell navigationShell, List<Widget> children) =>
      HomePage(
        currentIndex: navigationShell.currentIndex,
        branchNavigators: children,
        onNavigationItemSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      );
}

@immutable
class DashboardBranchData extends StatefulShellBranchData {
  const DashboardBranchData();
}

@immutable
class DashboardRoute extends GoRouteData implements RouteDataModel {
  const DashboardRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const DashboardPageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.dashboard.permissionName;

  @override
  String get routeLocation => location;
}
