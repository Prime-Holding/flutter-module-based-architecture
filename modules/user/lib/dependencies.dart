import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart' show Provider, ReadContext;
import 'package:provider/single_child_widget.dart';
import 'package:shared/shared.dart';

import 'src/lib_auth/blocs/user_account_bloc.dart';
import 'src/lib_auth/data_sources/local/auth_token_data_source.dart';
import 'src/lib_auth/data_sources/local/auth_token_secure_data_source.dart';
import 'src/lib_auth/data_sources/remote/auth_data_source.dart';
import 'src/lib_auth/data_sources/remote/refresh_token_data_source.dart';
import 'src/lib_auth/repositories/auth_repository.dart';
import 'src/lib_auth/services/access_token_service.dart';
import 'src/lib_auth/services/auth_service.dart';
import 'src/lib_auth/services/user_account_service.dart';

List<SingleChildWidget> get dependencies => [
      ..._dataSources,
      ..._repositories,
      ..._services,
      ..._blocs,
    ];

List<SingleChildWidget> get _dataSources => [
      Provider<AuthTokenDataSource>(
        create: (context) => AuthTokenSecureDataSource(context.read()),
      ),
      Provider<AuthDataSource>(
        create: (context) => AuthDataSource(context.read<ApiHttpClient>()),
      ),
      Provider<RefreshTokenDataSource>(
        create: (context) => RefreshTokenDataSource(
          context.read<ApiHttpClient>(),
        ),
      ),
    ];

List<SingleChildWidget> get _repositories => [
      Provider<AuthRepository>(
        create: (context) => AuthRepository(
          context.read(),
          context.read(),
          context.read(),
          context.read(),
        ),
      )
    ];

List<SingleChildWidget> get _services => [
      Provider<UserAccountService>(
        create: (context) => UserAccountService(
          context.read(),
          context.read(),
          context.read(),
          context.read(),
        ),
      ),
      Provider<AuthService>(
        create: (context) => AuthService(
          context.read(),
        ),
      ),
      Provider<AccessTokenService>(
        create: (context) => AccessTokenService(
          context.read(),
        ),
      )
    ];

List<SingleChildWidget> get _blocs => [
      RxBlocProvider<UserAccountBlocType>(
        create: (context) => UserAccountBloc(
          context.read(),
          context.read(),
          context.read(),
          context.read(),
        ),
      ),
    ];
