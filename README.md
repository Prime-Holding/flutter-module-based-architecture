# Motivation
### Code organisation and ownership
- [Logically-connected](modules/user/lib/src) features are placed in one module, instead of being distributed [across the application](documentation/feature_based_project_structure.png).
- In this approach, the Data Layer, Business Models, DI and Tests are distributed across [specific](modules/notifications/lib/src/base) modules, unlike the feature-based architecture where they are grouped together ([services](documentation/common_services.png), [repositories](documentation/base_repositories.png))
- Improved PR review process due to code encapsulation through [modules](modules).
- Possible [widgetbook](https://pub.dev/packages/widgetbook) integration

### Efficient work distribution for squad-based projects 
- One squad owns one or multiple [modules](modules).
- All squads own the following packages
  - [shared](shared) package
  - the [application](app) itself.
  - [Design system](design_system) and [assets](design_system_assets)
    
<img src="https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/documentation/module-based-architecture.png?raw=true" alt="Rx Bloc Architecture"></img>


# Disadvantages
### Not-suitable for small applications (Less than 4 Flutter Engineers, less than four months)
### High complexity and extra development overhead compared with the feature-based structure
- Dealing with separate packages ([shared](shared), [design_system](design_system) and [assets](design_system_assets))
- Feature-agnostic [routes](shared/lib/src/lib_router/routes) and [route resolver](app/lib/lib_router/services/route_resolver_service.dart)
  - An extra [route model](shared/lib/src/lib_router/routes/mfa.dart) class needs to be implemented in the shared package
  - Each route model must be mapped to a [go_router route](app/lib/lib_router/routes) in the route resolver service.
- Direct dependencies needs to be [specified](modules/notifications/pubspec.yaml) in every module. 
  - Note: the required dependency versions need to be specified only in the [end modules](blob/6907fc3f8f53bd5eed06ad17e7aee9b970f68663/modules/notifications/pubspec.yaml#L15)

# Limitations
- Module-specific objects can’t be passed through the [Coordinator](shared/lib/src/blocs/coordinator_bloc.dart) class
  - Record types or shared models should can be utilized.
-  [Localisations](shared/lib/src/l10n/arb) and [Permissions](shared/lib/src/lib_permissions/models/route_permissions.dart) must be implemented in the shared package.
- [Integration tests](app/integration_test) must implemented in the application.
- Domain-specific [error](shared/lib/src/models/errors) codes must be implemented in the shared package.
