part of '../router.dart';

@immutable
class ShowcaseBranchData extends StatefulShellBranchData {
  const ShowcaseBranchData();
}

@immutable
class ShowcaseRoute extends GoRouteData implements RouteDataModel {
  const ShowcaseRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const ShowcasePage(),
      );

  @override
  String get permissionName => RouteModel.showcase.permissionName;

  @override
  String get routeLocation => location;
}

@immutable
class CounterBranchData extends StatefulShellBranchData {
  const CounterBranchData();
}

@immutable
class CounterRoute extends GoRouteData implements RouteDataModel {
  const CounterRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const CounterPageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.counter.permissionName;

  @override
  String get routeLocation => location;
}

@immutable
class WidgetToolkitBranchData extends StatefulShellBranchData {
  const WidgetToolkitBranchData();
}

@immutable
class WidgetToolkitRoute extends GoRouteData implements RouteDataModel {
  const WidgetToolkitRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const WidgetToolkitWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.widgetToolkit.permissionName;

  @override
  String get routeLocation => location;
}

@immutable
class DeepLinkBranchData extends StatefulShellBranchData {
  const DeepLinkBranchData();
}

@immutable
class DeepLinksRoute extends GoRouteData implements RouteDataModel {
  const DeepLinksRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const DeepLinkListPageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.deepLinks.permissionName;

  @override
  String get routeLocation => location;
}

@immutable
class DeepLinkDetailsRoute extends GoRouteData implements RouteDataModel {
  const DeepLinkDetailsRoute(this.id);

  final String id;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: DeepLinkDetailsWithDependencies(
          deepLinkId: id,
          deepLink: state.extra as DeepLinkModel?,
        ),
      );

  @override
  String get permissionName => RouteModel.deepLinkDetails.permissionName;

  @override
  String get routeLocation => location;
}

@immutable
class EnterMessageRoute extends GoRouteData implements RouteDataModel {
  const EnterMessageRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const EnterMessageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.enterMessage.permissionName;

  @override
  String get routeLocation => location;
}

class QrCodeBranchData extends StatefulShellBranchData {
  const QrCodeBranchData();
}

@immutable
class QrCodeRoute extends GoRouteData implements RouteDataModel {
  const QrCodeRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const QrScannerPageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.qrCode.permissionName;

  @override
  String get routeLocation => location;
}

class OtpBranchData extends StatefulShellBranchData {
  const OtpBranchData();
}

@immutable
class FeatureOtpRoute extends GoRouteData implements RouteDataModel {
  const FeatureOtpRoute();

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: const OtpPageWithDependencies(),
      );

  @override
  String get permissionName => RouteModel.showcase.permissionName;

  @override
  String get routeLocation => location;
}
