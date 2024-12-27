// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa/mfa.dart';
import 'package:notifications/notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:showcases/showcases.dart';
import 'package:user/user.dart';

import '../../feature_dashboard/ui/di/dashboard_page_with_dependencies.dart';
import '../../feature_home/ui/widgets/home_page.dart';
import '../../feature_splash/domain/services/splash_service.dart';
import '../../feature_splash/ui/di/splash_page_with_dependencies.dart';
import '../domain/models/route_model.dart';
import '../domain/models/routes_path.dart';
import 'widgets/error_page.dart';

part 'router.g.dart';
part 'routes/mfa_routes.dart';
part 'routes/onboarding_routes.dart';
part 'routes/profile_routes.dart';
part 'routes/routes.dart';
part 'routes/showcase_routes.dart';

/// A wrapper class implementing all the navigation logic and providing
/// [GoRouter] instance through its getter method [AppRouter.router].
///
/// `AppRouter` depends on [CoordinatorBloc] so the user can be redirected to
/// specific page if the `isAuthenticated` state changes (It can be used with
/// some other global state change as well).
class AppRouter {
  AppRouter({
    required this.coordinatorBloc,
  });

  final CoordinatorBlocType coordinatorBloc;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final _GoRouterRefreshStream _refreshListener = _GoRouterRefreshStream(
    coordinatorBloc.states.isAuthenticated,
    coordinatorBloc.states.isOtpConfirmed,
    coordinatorBloc.states.isPinCodeConfirmed,
  );

  String? previousLocation;

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: _pageRedirectionsWithAnalytics,
    refreshListenable: _refreshListener,
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),
  );

  /// Analytics
  FutureOr<String?> _pageRedirectionsWithAnalytics(
    BuildContext context,
    GoRouterState state,
  ) async {
    final redirectLocation = await _pageRedirections(context, state);
    coordinatorBloc.events
        .navigationChanged(redirectLocation ?? state.uri.path);
    return redirectLocation;
  }

  /// This method contains all redirection logic.
  FutureOr<String?> _pageRedirections(
    BuildContext context,
    GoRouterState state,
  ) async {
    /// TODO Note that, the saved pin code is always deleted after a user
    /// logs out.

    if (state.matchedLocation == const VerifyPinCodeRoute().location &&
        _refreshListener.isPinCodeConfirmed) {
      if (previousLocation == null) {
        return const DashboardRoute().location;
      } else if (previousLocation == const UpdatePinRoute().location ||
          previousLocation == const CreatePinRoute().location) {
        return const ProfileRoute().location;
      }
      return previousLocation;
    }

    if ((state.matchedLocation != const LoginRoute().location) &&
        (state.matchedLocation != const VerifyPinCodeRoute().location) &&
        (state.matchedLocation != const CreatePinRoute().location) &&
        (state.matchedLocation != const SplashRoute().location)) {
      previousLocation = state.matchedLocation;
    }
    if (_refreshListener.isLoggedIn &&
        state.uri.queryParameters['from'] != null) {
      return state.uri.queryParameters['from'];
    }

    if (_refreshListener.isLoggedIn &&
        _refreshListener.isPinCodeConfirmed &&
        state.matchedLocation == const VerifyPinCodeRoute().location) {
      return const DashboardRoute().location;
    }

    if (_refreshListener.isLoggedIn &&
        state.matchedLocation == const LoginRoute().location) {
      return const OtpRoute().location;
    }
    if (_refreshListener.isLoggedIn &&
        _refreshListener.isOtpConfirmed &&
        state.matchedLocation == const OtpRoute().location) {
      return const DashboardRoute().location;
    }

    if (state.matchedLocation == const SplashRoute().location) {
      return null;
    }
    if (!context.read<SplashService>().isAppInitialized) {
      return '${const SplashRoute().location}?from=${state.uri.toString()}';
    }

    final pathInfo =
        router.routeInformationParser.configuration.findMatch(state.uri);

    final routeName = RouteModel.getRouteNameByFullPath(pathInfo.fullPath);

    final hasPermissions = routeName != null
        ? await context
            .read<PermissionsService>()
            .hasPermission(routeName, graceful: true)
        : true;

    if (!_refreshListener.isLoggedIn && !hasPermissions) {
      return '${const LoginRoute().location}?from=${state.uri.toString()}';
    }

    if (!hasPermissions) {
      return const DashboardRoute().location;
    }

    return null;
  }
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(
    Stream<bool> stream,
    Stream<bool> streamOTP,
    Stream<bool> streamPinCode,
  ) {
    _subscription = stream.listen(
      (bool isLoggedIn) {
        this.isLoggedIn = isLoggedIn;
        notifyListeners();
      },
    );

    _subscriptionOtp = streamOTP.listen((bool isOtpConfirmed) {
      this.isOtpConfirmed = isOtpConfirmed;
      notifyListeners();
    });
    _subscriptionPinCode = streamPinCode.listen((bool isPinCodeConfirmed) {
      this.isPinCodeConfirmed = isPinCodeConfirmed;
      notifyListeners();
      this.isPinCodeConfirmed = false;
    });
  }

  late final StreamSubscription<bool> _subscription;
  late final StreamSubscription<bool> _subscriptionOtp;

  late final StreamSubscription<bool> _subscriptionPinCode;

  late bool isLoggedIn = false;
  late bool isOtpConfirmed = false;
  late bool isPinCodeConfirmed = false;

  @override
  void dispose() {
    _subscription.cancel();
    _subscriptionOtp.cancel();
    _subscriptionPinCode.cancel();
    super.dispose();
  }
}
