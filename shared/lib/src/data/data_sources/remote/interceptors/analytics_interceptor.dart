// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

/// Interceptors are a simple way to intercept and modify http requests globally
/// before they are sent to the server. That allows us to configure
/// authentication tokens, add logs of the requests, add custom headers and
/// much more.
/// Interceptors can perform a variety of implicit tasks, from authentication
/// to logging, for every HTTP request/response that is intercepted.
///
/// You should implement one or more methods from the interface.
class AnalyticsInterceptor extends Interceptor {
  AnalyticsInterceptor(this.observer);

  final FirebaseAnalyticsObserver observer;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final hasResponse = err.response != null;
    observer.analytics.logEvent(name: 'RequestError', parameters: {
      'errorType': err.type.toString(),
      'errorMessage': err.message.toString(),
      'stackTrace': err.stackTrace.toString(),
      'requestUrl': err.requestOptions.path,
      'requestMethod': err.requestOptions.method,
      if (hasResponse && err.response!.statusCode != null)
        'responseStatusCode': err.response!.statusCode!,
      if (hasResponse && err.response!.data != null)
        'responseData': err.response!.data.toString(),
    });
    super.onError(err, handler);
  }
}
