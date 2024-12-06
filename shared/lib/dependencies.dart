library shared_dependencies;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import 'src/config/environment_config.dart';
import 'src/data_sources/local/shared_preferences_instance.dart';
import 'src/data_sources/remote/sse_remote_data_source.dart';
import 'src/mappers/error_mappers/error_mapper.dart';
import 'src/repositries/sse_repository.dart';
import 'src/services/sse_service.dart';
import 'src/http_clients/api_http_client.dart';
import 'src/http_clients/plain_http_client.dart';
import 'src/lib_analytics/blocs/analytics_bloc.dart';
import 'src/lib_analytics/repositories/analytics_repository.dart';
import 'src/lib_analytics/services/analytics_service.dart';
import 'src/lib_change_language/bloc/change_language_bloc.dart';
import 'src/lib_change_language/data_sources/language_local_data_source.dart';
import 'src/lib_change_language/repositories/language_repository.dart';
import 'src/lib_change_language/services/app_language_service.dart';
import 'src/lib_permissions/data_sources/remote/permissions_remote_data_source.dart';
import 'src/lib_permissions/repositories/permissions_repository.dart';
import 'src/lib_permissions/services/permissions_service.dart';
import 'src/lib_pin_code/bloc/create_pin_bloc.dart';
import 'src/lib_pin_code/bloc/update_and_verify_pin_bloc.dart';
import 'src/lib_pin_code/data_source/pin_biometrics_local_data_source.dart';
import 'src/lib_pin_code/data_source/pin_code_local_data_source.dart';
import 'src/lib_pin_code/data_source/remote/pin_code_data_source.dart';
import 'src/lib_pin_code/repository/pin_biometrics_repository.dart';
import 'src/lib_pin_code/repository/pin_code_repository.dart';
import 'src/lib_pin_code/services/create_pin_code_service.dart';
import 'src/lib_pin_code/services/pin_biometrics_service.dart';
import 'src/lib_pin_code/services/verify_pin_code_service.dart';
import 'src/lib_router/blocs/router_bloc.dart';
import 'src/lib_router/services/router_service.dart';
import 'src/lib_translations/data_sources/translations_data_source.dart';
import 'src/lib_translations/data_sources/translations_remote_data_source.dart';
import 'src/lib_translations/repositories/translations_repository.dart';
import 'src/lib_translations/services/translations_service.dart';

List<SingleChildWidget> dependencies(EnvironmentConfig config) => [
      ..._mapper,
      ..._httpClients(config),
      ..._firebase,
      ..._dataSources(config),
      ..._repositories(config),
      ..._services,
      ..._blocs,
    ];

List<SingleChildWidget> get _blocs => [
      RxBlocProvider<RouterBlocType>(
        create: (context) => RouterBloc(
          router: context.read(),
          permissionsService: context.read(),
          resolverService: context.read(),
        ),
      ),
      RxBlocProvider<UpdateAndVerifyPinBlocType>(
        create: (context) => UpdateAndVerifyPinBloc(
          coordinatorBloc: context.read(),
          service: context.read(),
          pinBiometricsService: context.read(),
        ),
      ),
      RxBlocProvider<CreatePinBlocType>(
        create: (context) => CreatePinBloc(
          coordinatorBloc: context.read(),
          service: context.read(),
        ),
      ),
      RxBlocProvider<ChangeLanguageBlocType>(
        create: (context) => ChangeLanguageBloc(
          languageService: context.read(),
        ),
      ),
      RxBlocProvider<AnalyticsBlocType>(
        create: (context) => AnalyticsBloc(
          context.read(),
          context.read(),
        ),
      ),
    ];

List<SingleChildWidget> get _mapper => [
      Provider<ErrorMapper>(
        create: (context) => ErrorMapper(context.read()),
      ),
    ];

List<Provider> _httpClients(EnvironmentConfig config) => [
      Provider<PlainHttpClient>(
        create: (context) => PlainHttpClient(),
      ),
      Provider<ApiHttpClient>(
        create: (context) {
          final client = ApiHttpClient()..options.baseUrl = config.baseUrl;
          return client;
        },
      ),
    ];
List<Provider> get _firebase => [
      Provider<FirebaseAnalyticsObserver>(
        create: (context) => FirebaseAnalyticsObserver(
          analytics: FirebaseAnalytics.instance,
        ),
      ),
      Provider<AnalyticsRepository>(
        create: (context) => AnalyticsRepository(
          context.read(),
          FirebaseCrashlytics.instance,
          FirebaseAnalytics.instance,
        ),
      ),
      Provider<AnalyticsService>(
        create: (context) => AnalyticsService(
          context.read(),
        ),
      ),
    ];

List<SingleChildWidget> _dataSources(EnvironmentConfig config) => [
      Provider<FlutterSecureStorage>(
        create: (context) => const FlutterSecureStorage(),
      ),
      Provider<SharedPreferencesInstance>(
        create: (context) => SharedPreferencesInstance(),
      ),
      Provider<SseRemoteDataSource>(
        create: (context) => SseRemoteDataSource(
          context.read<ApiHttpClient>(),
          config.baseUrl,
        ),
      ),
      Provider<SharedPreferencesInstance>(
        create: (context) => SharedPreferencesInstance(),
      ),
      Provider<PinCodeLocalDataSource>(
        create: (context) => PinCodeLocalDataSource(
          context.read(),
        ),
      ),
      Provider<PinCodeDataSource>(
        create: (context) => PinCodeDataSource(
          context.read<ApiHttpClient>(),
          baseUrl: config.baseUrl,
        ),
      ),
      Provider<BiometricsLocalDataSource>(
        create: (context) => PinBiometricsLocalDataSource(context.read()),
      ),
      Provider<LanguageLocalDataSource>(
        create: (context) => LanguageLocalDataSource(context.read()),
      ),
      Provider<PermissionsRemoteDataSource>(
        create: (context) => PermissionsRemoteDataSource(
          context.read<ApiHttpClient>(),
        ),
      ),
      Provider<TranslationsDataSource>(
        create: (context) => TranslationsRemoteDataSource(
          context.read<ApiHttpClient>(),
        ),
      ),
      //
    ];

List<SingleChildWidget> _repositories(EnvironmentConfig config) => [
      Provider<SseRepository>(
        create: (context) => SseRepository(
          context.read(),
          context.read(),
        ),
      ),
      Provider<PinCodeRepository>(
        create: (context) => PinCodeRepository(
          context.read(),
          context.read(),
          context.read(),
        ),
      ),
      Provider<PinBiometricsRepository>(
        create: (context) => PinBiometricsRepository(
          context.read(),
        ),
      ),
      Provider<LanguageRepository>(
        create: (context) => LanguageRepository(
          context.read(),
          context.read(),
        ),
      ),
      Provider<PermissionsRepository>(
        create: (context) => PermissionsRepository(
          context.read(),
          context.read(),
        ),
      ),
      Provider<TranslationsRepository>(
        create: (context) => TranslationsRepository(
          context.read(),
          context.read(),
        ),
      ),
//
      //
    ];

List<SingleChildWidget> get _services => [
      Provider<SseService>(
        create: (context) => SseService(
          context.read(),
        ),
      ),
      Provider<VerifyPinCodeService>(
        create: (context) => VerifyPinCodeService(
          context.read(),
        ),
      ),
      Provider<PinBiometricsService>(
        create: (context) => PinBiometricsService(
          context.read(),
        ),
      ),
      Provider<PinBiometricsService>(
        create: (context) => PinBiometricsService(
          context.read(),
        ),
      ),
      Provider<AppLanguageService>(
        create: (context) => AppLanguageService(
          languageRepository: context.read(),
        ),
      ),
      Provider<CreatePinCodeService>(
        create: (context) => CreatePinCodeService(
          context.read(),
        ),
      ),
      Provider<PermissionsService>(
        create: (context) => PermissionsService(
          context.read(),
        ),
      ),
      Provider<TranslationsService>(
        create: (context) => TranslationsService(
          context.read(),
        ),
      ),
      Provider<RouterService>(
        create: (context) => RouterService(
          context.read(),
          context.read(),
          context.read(),
        ),
      ),
    ];
