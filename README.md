
# Motivation
### Efficient work distribution for squad-based projects 
- One squad owns one or multiple modules.
- All squads own the shared package and the application itself.
### Code organisation and ownership
- Logically-connected features are placed in one module
- In this approach, the Data Layer, Business Models, DI and Tests are distributed across specific modules, unlike the feature-based architecture where they are grouped together.
- Improved PR review process due to code encapsulation through modules.


<img src="https://github.com/Prime-Holding/flutter-module-based-architecture/blob/main/documentation/module-based-architecture.png?raw=true" alt="Rx Bloc Architecture"></img>


# Disadvantages
### Not-suitable for small applications (Less than 4 Flutter Engineers, less than four months)
### IDE performance issues
- Potential IDE performance issues caused by the Dart analyser when dealing with a large number of (20+) modules
### High complexity and extra development overhead compared with the feature-based structure
- Dealing with separate packages (shared and design_system)
- Feature-agnostic router and route resolver
  - An extra route model class needs to be implemented in the shared package
  - Each route model must be mapped to a go_router route in the route resolver service.
- Direct dependencies needs to be specified in every module. 
  - Note: the required dependency versions need to be specified only in the end modules

# Limitations
- Module-specific objects can’t be passed through the Coordinator
  - Record types or shared models should can be utilized.
-  Localisations and Permissions must be implemented in the shared package.
- Integration tests must implemented in the application.
- Domain-specific error codes must be implemented in the shared package.

 
