import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../data_sources/remote/interceptors/analytics_interceptor.dart';
import '../data_sources/remote/interceptors/log_interceptor.dart';

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

  @override
  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      Object? data,
      Options? options}) {
    // TODO: implement download
    throw UnimplementedError();
  }
}
