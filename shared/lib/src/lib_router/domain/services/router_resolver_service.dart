import '../../domain/models/route_data_model.dart';
import '../../routes.dart';

abstract class RouterResolverService {
  RouterResolverService();

  RouteDataModel resolveRoute(AppRoute route);
}
