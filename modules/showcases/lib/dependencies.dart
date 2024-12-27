import 'package:provider/provider.dart' show Provider, ReadContext;
import 'package:provider/single_child_widget.dart';
import 'package:shared/shared.dart';

import 'src/data/data_sources/remote/deep_link_remote_data_source.dart';
import 'src/data/repositories/deep_link_repository.dart';
import 'src/domain/services/deep_link_service.dart';

List<SingleChildWidget> get dependencies => [
      ..._dataSources,
      ..._repositories,
      ..._services,
    ];

List<Provider> get _dataSources => [
      Provider<DeepLinkRemoteDataSource>(
        create: (context) => DeepLinkRemoteDataSource(
          context.read<ApiHttpClient>(),
        ),
      ),
    ];

List<Provider> get _repositories => [
      Provider<DeepLinkRepository>(
        create: (context) => DeepLinkRepository(
          context.read(),
          context.read(),
        ),
      ),
    ];

List<Provider> get _services => [
      Provider<DeepLinkService>(
        create: (context) => DeepLinkService(
          context.read(),
        ),
      ),
    ];
