// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../controllers/authentication_controller.dart';
import '../controllers/count_controller.dart';
import '../controllers/deep_links_controller.dart';
import '../controllers/mfa_controller.dart';
import '../controllers/permissions_controller.dart';
import '../controllers/pin_code_controller.dart';
import '../controllers/push_notifications_controller.dart';
import '../controllers/translations_controller.dart';
import '../repositories/auth_token_repository.dart';
import '../repositories/pin_code_repository.dart';
import '../repositories/translations_repository.dart';
import '../services/authentication_service.dart';
import '../services/pin_code_service.dart';
import '../utils/api_controller.dart';
import '../utils/dependency_injector.dart';

class ServerDependencies {
  /// Registers all dependencies used for the controllers
  static Future<void> registerDependencies(DependencyInjector di) async {
    di.register(AuthTokenRepository());
    di.register(AuthenticationService(di.get()));
    di.register(TranslationsRepository());
    di.register(PinCodeRepository());
    di.register(PinCodeService(di.get()));

    /// TODO: Add your dependencies here
  }

  /// Registers all controllers that provide some kind of API
  static Future<void> registerControllers(
    RouteGenerator routeGenerator,
    DependencyInjector di,
  ) async {
    routeGenerator
      ..addController(TranslationsController(di.get()))
      ..addController(CountController())
      ..addController(AuthenticationController(di.get()))
      ..addController(PushNotificationsController())
      ..addController(PermissionsController(di.get()))
      ..addController(DeepLinksController())
      ..addController(MfaController())
      ..addController(PinCodeController(di.get()));

    /// TODO: Add your controllers here
  }
}
