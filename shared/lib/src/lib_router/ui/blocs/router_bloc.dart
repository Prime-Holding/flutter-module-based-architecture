// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';
import 'package:go_router/go_router.dart';

import '../../../lib_permissions/domain/services/permissions_service.dart';
import '../../routes.dart';
import '../../../domain/models/errors/error_model.dart';

part 'router_bloc.rxb.g.dart';

/// A contract class containing all events of the NavigationBloC.
abstract class RouterBlocEvents {
  /// Uses [GoRouter.go()] to navigates to given location with an optional
  /// [extra] object which can be passed as part of the navigation.
  ///
  /// See also:
  /// * [goToLocation] which navigates to given location.
  /// * [push] which pushes the location onto the page stack.
  void go(AppRoute route, {Object? extra});

  /// Navigates to given location.
  ///
  /// See also:
  /// * [go] which navigates to the location.
  /// * [push] which pushes the location onto the page stack.
  void goToLocation(String location);

  /// Uses [GoRouter.push()] to push the given location onto the page stack with
  /// an optional [extra] object which can be passed as part of the navigation.
  ///
  /// See also:
  /// * [go] which navigates to the location.
  /// * [goToLocation] which navigates to given location.
  void push(AppRoute route, {Object? extra});

  /// Uses [GoRouter.pushReplacement()] to replace the given location in the page
  /// stack and always use a new page key. The method accepts an optional [extra]
  /// object, which can be passed as part of the navigation.
  void pushReplace(AppRoute route, {Object? extra});

  /// Uses [GoRouter.pop()] to pop from the given location to the previous page
  /// from the page stack with an optional [result] object which can be returned
  /// as part of the navigation.
  void pop([Object? result]);
}

/// A contract class containing all states of the NavigationBloC.
abstract class RouterBlocStates {
  /// The main state responsible for handling errors.
  ConnectableStream<ErrorModel> get errors;

  /// The state is updated when one of the navigation methods: [go], [push] or
  /// [goToLocation] are called.
  ConnectableStream<void> get navigationPath;
}

@RxBloc()
class RouterBloc extends $RouterBloc {
  RouterBloc({
    required GoRouter router,
    required PermissionsService permissionsService,
    required RouterResolverService resolverService,
  })  : _router = router,
        _resolverService = resolverService,
        _permissionsService = permissionsService {
    errors.connect().addTo(_compositeSubscription);
    navigationPath.connect().addTo(_compositeSubscription);
  }

  final RouterResolverService _resolverService;
  final PermissionsService _permissionsService;
  final GoRouter _router;

  @override
  ConnectableStream<ErrorModel> _mapToErrorsState() => errorState
      // TODO: Remove workaround when GoRouter gets updated for Flutter 3.24
      .where((exc) =>
          exc.toString() !=
          "Exception: type 'ResultSuccess<MfaResponse>' is not a subtype of type 'Function?' of 'result'")
      .mapToErrorModel()
      .publish();

  @override
  ConnectableStream<void> _mapToNavigationPathState() => Rx.merge([
        _$goEvent
            .throttleTime(const Duration(seconds: 1))
            .switchMap((routeData) => _go(routeData).asResultStream()),
        _$pushEvent
            .throttleTime(const Duration(seconds: 1))
            .switchMap((routeData) => _push(routeData).asResultStream()),
        _$goToLocationEvent.doOnData(_router.go).asResultStream(),
        _$pushReplaceEvent
            .throttleTime(const Duration(seconds: 1))
            .switchMap((routeData) => _pushReplace(routeData).asResultStream()),
        _$popEvent.doOnData(_pop).asResultStream(),
      ]).setErrorStateHandler(this).whereSuccess().publish();

  Future<void> _go(_GoEventArgs routeData) async {
    final route = _resolverService.resolveRoute(routeData.route);

    await _permissionsService.checkPermission(route.permissionName);
    return _router.go(route.routeLocation, extra: routeData.extra);
  }

  Future<void> _push(_PushEventArgs routeData) async {
    final route = _resolverService.resolveRoute(routeData.route);

    await _permissionsService.checkPermission(route.permissionName);
    await _router.push(route.routeLocation, extra: routeData.extra);
  }

  Future<void> _pushReplace(_PushReplaceEventArgs routeData) async {
    final route = _resolverService.resolveRoute(routeData.route);

    await _permissionsService.checkPermission(route.permissionName);
    await _router.pushReplacement(route.routeLocation, extra: routeData.extra);
  }

  void _pop([Object? result]) => _router.pop(result);
}
