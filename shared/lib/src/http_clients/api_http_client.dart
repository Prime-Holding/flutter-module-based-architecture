import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../data/data_sources/remote/interceptors/analytics_interceptor.dart';
import '../data/data_sources/remote/interceptors/log_interceptor.dart';

/// An HTTP client for use with the main backed API.
class ApiHttpClient with DioMixin implements Dio {
  ApiHttpClient() {
    options = BaseOptions();
    httpClientAdapter = IOHttpClientAdapter();

    //TODO: Enable the proxy only in development mode.
    // if (EnvironmentConfig.enableDevMenu) {
    //   httpClientAdapter.setupProxy();
    // }
  }

  final logInterceptor = createDioEventLogInterceptor('ApiHttpClient');

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
