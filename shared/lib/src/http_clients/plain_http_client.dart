import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../data_sources/remote/interceptors/analytics_interceptor.dart';
import '../data_sources/remote/interceptors/log_interceptor.dart';

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
