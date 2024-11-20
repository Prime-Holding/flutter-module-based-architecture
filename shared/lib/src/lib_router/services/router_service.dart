import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

import '../routes.dart';

class RouterService {
  RouterService(
    this._router,
    this._permissionsService,
    this._resolverService,
  );

  final GoRouter _router;
  final PermissionsService _permissionsService;
  final RouterResolverService _resolverService;

  Future<void> go(AppRoute routeData, Object? extra) async {
    final route = _resolverService.resolveRoute(routeData);

    await _permissionsService.checkPermission(route.permissionName);
    _router.go(route.routeLocation, extra: extra);
  }

  Future<void> goToLocation(String route) async => _router.go(route);

  Future<T?> push<T extends Object?>(
    AppRoute route, {
    Object? extra,
  }) async {
    final routeModel = _resolverService.resolveRoute(route);

    await _permissionsService.checkPermission(routeModel.permissionName);
    return await _router.push<T>(routeModel.routeLocation, extra: extra);
  }

  Future<T?> replace<T>(AppRoute route, Object? extra) async {
    final routeModel = _resolverService.resolveRoute(route);

    await _permissionsService.checkPermission(routeModel.permissionName);
    return await _router.replace(routeModel.routeLocation, extra: extra);
  }

  void pop([Object? result]) => _router.pop(result);
}
