// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import 'routes_path.dart';

enum RouteModel {
  showcase(
    pathName: RoutesPath.showcase,
    fullPath: '/showcase',
    permissionName: RoutePermissions.showcase,
  ),

  qrCode(
    pathName: RoutesPath.qrCode,
    fullPath: '/qrCode',
    permissionName: RoutePermissions.qrCode,
  ),

  mfa(
    pathName: RoutesPath.mfa,
    fullPath: '/mfa',
    permissionName: RoutePermissions.mfa,
  ),

  dashboard(
    pathName: RoutesPath.dashboard,
    fullPath: '/dashboard',
    permissionName: RoutePermissions.dashboard,
  ),
  profile(
    pathName: RoutesPath.profile,
    fullPath: '/profile',
    permissionName: RoutePermissions.profile,
  ),
  splash(
    pathName: RoutesPath.splash,
    fullPath: '/splash',
    permissionName: RoutePermissions.splash,
  ),
  counter(
    pathName: RoutesPath.counter,
    fullPath: '/counter',
    permissionName: RoutePermissions.counter,
  ),
  widgetToolkit(
    pathName: RoutesPath.widgetToolkit,
    fullPath: '/widget-toolkit',
    permissionName: RoutePermissions.widgetToolkit,
  ),
  notifications(
    pathName: RoutesPath.notifications,
    fullPath: '/notifications',
    permissionName: RoutePermissions.notifications,
  ),
  pinCode(
    pathName: RoutesPath.verifyPinCode,
    fullPath: '/verifyPinCode',
    permissionName: RoutePermissions.pinCode,
  ),
  login(
    pathName: RoutesPath.login,
    fullPath: '/login',
    permissionName: RoutePermissions.login,
  ),
  enterMessage(
    pathName: RoutesPath.enterMessage,
    fullPath: '/enterMessage',
    permissionName: RoutePermissions.enterMessage,
  ),
  deepLinks(
    pathName: RoutesPath.deepLinks,
    fullPath: '/deepLinks',
    permissionName: RoutePermissions.deepLinks,
  ),
  deepLinkDetails(
    pathName: RoutesPath.deepLinkDetails,
    fullPath: '/deepLinks/:id',
    permissionName: RoutePermissions.deepLinkDetails,
  );

  final String pathName;
  final String fullPath;
  final String permissionName;

  const RouteModel({
    required this.pathName,
    required this.fullPath,
    required this.permissionName,
  });

  static final Map<String, String> nameByPath = {};

  static String? getRouteNameByFullPath(String path) {
    if (nameByPath.isEmpty) {
      for (RouteModel paths in RouteModel.values) {
        nameByPath[paths.fullPath] = paths.permissionName;
      }
    }
    return nameByPath[path];
  }
}
