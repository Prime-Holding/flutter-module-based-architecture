import 'package:provider/provider.dart' show Provider, ReadContext;
import 'package:provider/single_child_widget.dart';
import 'package:shared/shared.dart';

import 'src/lib_mfa/data/data_source/remote/mfa_data_source.dart';
import 'src/lib_mfa/data/repositories/mfa_repository.dart';
import 'src/lib_mfa/domain/services/mfa_service.dart';

List<SingleChildWidget> get dependencies => [
      ..._dataSources,
      ..._repositories,
      ..._services,
    ];

List<SingleChildWidget> get _dataSources => [
      Provider<MfaDataSource>(
        create: (context) => MfaDataSource(context.read<ApiHttpClient>()),
      ),
    ];

List<SingleChildWidget> get _repositories => [
      Provider<MfaRepository>(
        create: (context) => MfaRepository(
          context.read(),
          context.read(),
        ),
      )
    ];

List<SingleChildWidget> get _services => [
      Provider<MfaService>(
        create: (context) => MfaService(
          context.read(),
          context.read(),
        ),
      )
    ];
