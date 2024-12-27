import 'package:shared/routes.dart' as routes;
import 'package:shared/shared.dart';

import 'router.dart';

class RouteResolver extends RouterResolverService {
  @override
  RouteDataModel resolveRoute(routes.AppRoute route) => switch (route) {
        routes.ShowcaseRoute() => const ShowcaseRoute(),
        routes.CounterRoute() => const CounterRoute(),
        routes.WidgetToolkitRoute() => const WidgetToolkitRoute(),
        routes.DeepLinksRoute() => const DeepLinksRoute(),
        routes.DeepLinkDetailsRoute(id: final id) => DeepLinkDetailsRoute(id),
        routes.EnterMessageRoute() => const EnterMessageRoute(),
        routes.QrCodeRoute() => const QrCodeRoute(),
        routes.MfaPinBiometricsRoute(transactionId: final transactionId) =>
          MfaPinBiometricsRoute(transactionId),
        routes.MfaOtpRoute(transactionId: final transactionId) =>
          MfaOtpRoute(transactionId),
        routes.FeatureMfaRoute() => const FeatureMfaRoute(),
        routes.FeatureOtpRoute() => const FeatureOtpRoute(),
        routes.CreatePinRoute() => const CreatePinRoute(),
        routes.ProfileRoute() => const ProfileRoute(),
        routes.NotificationsRoute() => const NotificationsRoute(),
        routes.UpdatePinRoute() => const UpdatePinRoute(),
        routes.DashboardRoute() => const DashboardRoute(),
        routes.SplashRoute() => const SplashRoute(),
        routes.LoginRoute() => const LoginRoute(),
        routes.OtpRoute() => const OtpRoute(),
        routes.VerifyPinCodeRoute() => const VerifyPinCodeRoute(),
        // TODO: Handle this case.
        routes.FeatureMfaKoceRoute() => throw UnimplementedError(),
      } as RouteDataModel;
}
