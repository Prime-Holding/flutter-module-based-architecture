
# Motivation
### Efficient work distribution for squad-based projects 
- One squad owns one or multiple [modules](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/modules).
- All squads own the following packages
  - [shared](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/shared) package
  - the [application](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/app) itself.
  - [Design system](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/design_system) and [assets](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/design_system_assets)
### Code organisation and ownership
- [Logically-connected](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/modules/user/lib/src) features are placed in one module
- In this approach, the Data Layer, Business Models, DI and Tests are distributed across [specific](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/modules/notifications/lib/src/base) modules, unlike the feature-based architecture where they are [grouped together](https://github.com/Prime-Holding/rx_bloc/tree/develop/examples/reminders/lib/base).
- Improved PR review process due to code encapsulation through [modules](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/modules).
- Possible [widgetbook](https://pub.dev/packages/widgetbook) integration


<img src="https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/documentation/module-based-architecture.png?raw=true" alt="Rx Bloc Architecture"></img>


# Disadvantages
### Not-suitable for small applications (Less than 4 Flutter Engineers, less than four months)
### IDE performance issues
- Potential IDE performance issues caused by the Dart analyser when dealing with a large number of (20+) modules
### High complexity and extra development overhead compared with the feature-based structure
- Dealing with separate packages ([shared](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/shared), [design_system](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/design_system) and [assets](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/design_system_assets))
- Feature-agnostic [routes](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/shared/lib/src/lib_router/routes) and [route resolver](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/app/lib/lib_router/services/route_resolver_service.dart)
  - An extra [route model](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/shared/lib/src/lib_router/routes/mfa.dart) class needs to be implemented in the shared package
  - Each route model must be mapped to a [go_router route](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/app/lib/lib_router/routes) in the route resolver service.
- Direct dependencies needs to be [specified](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/modules/notifications/pubspec.yaml) in every module. 
  - Note: the required dependency versions need to be specified only in the [end modules](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/6907fc3f8f53bd5eed06ad17e7aee9b970f68663/modules/notifications/pubspec.yaml#L15)

# Limitations
- Module-specific objects can’t be passed through the [Coordinator](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/shared/lib/src/blocs/coordinator_bloc.dart) class
  - Record types or shared models should can be utilized.
-  [Localisations](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/shared/lib/src/l10n/arb) and [Permissions](https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/shared/lib/src/lib_permissions/models/route_permissions.dart) must be implemented in the shared package.
- [Integration tests](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/app/integration_test) must implemented in the application.
- Domain-specific [error](https://github.com/Prime-Holding/flutter-module-based-architecture/tree/main/shared/lib/src/models/errors) codes must be implemented in the shared package.

 
