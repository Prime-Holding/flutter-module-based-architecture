// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shelf/shelf.dart';

import '../services/authentication_service.dart';
import '../utils/api_controller.dart';

class PermissionsController extends ApiController {
  PermissionsController(this._authenticationService);

  final AuthenticationService _authenticationService;

  @override
  void registerRequests(WrappedRouter router) {
    router.addRequest(
      RequestType.GET,
      '/api/permissions',
      permissionsHandler,
    );
  }

  Response permissionsHandler(Request request) {
    final headers = request.headers;
    if (!headers.containsKey(AuthenticationService.authHeader)) {
      return responseBuilder.buildOK(data: {
        'MfaRoute': false,
        'CreatePinRoute': false,
        'UpdatePinRoute': false,
        'DashboardRoute': false,
        'ProfileRoute': false,
        'SplashRoute': true,
        'CounterRoute': false,
        'WidgetToolkitRoute': true,
        'NotificationsRoute': false,
        'LoginRoute': true,
        'EnterMessageRoute': false,
        'DeepLinksRoute': false,
        'DeepLinkDetailsRoute': false,
      });
    }

    _authenticationService.isAuthenticated(request);

    return responseBuilder.buildOK(data: {
      'MfaRoute': true,
      'CreatePinRoute': true,
      'UpdatePinRoute': true,
      'DashboardRoute': true,
      'ProfileRoute': true,
      'SplashRoute': true,
      'CounterRoute': true,
      'WidgetToolkitRoute': true,
      'NotificationsRoute': true,
      'LoginRoute': true,
      'EnterMessageRoute': true,
      'DeepLinksRoute': true,
      'DeepLinkDetailsRoute': true,
    });
  }
}
