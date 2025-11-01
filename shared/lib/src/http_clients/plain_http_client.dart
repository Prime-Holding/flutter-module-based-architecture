import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../data/data_sources/remote/interceptors/analytics_interceptor.dart';
import '../data/data_sources/remote/interceptors/log_interceptor.dart';

/// An HTTP client with a minimal set of interceptors.
/// Used for accessing external resources and/or unprotected APIs.
class PlainHttpClient with DioMixin implements Dio {
  PlainHttpClient() {
    options = BaseOptions();
    httpClientAdapter = IOHttpClientAdapter();

    //TODO: Enable the proxy only in development mode.
    // if (EnvironmentConfig.enableDevMenu) {
    //   httpClientAdapter.setupProxy();
    // }
  }

  final logInterceptor = createDioEventLogInterceptor('PlainHttpClient');
  late AnalyticsInterceptor analyticsInterceptor;

  void configureInterceptors(
    AnalyticsInterceptor analyticsInterceptor,
  ) {
    this.analyticsInterceptor = analyticsInterceptor;

    interceptors.addAll([
      logInterceptor,
      analyticsInterceptor,
    ]);
  }
}
