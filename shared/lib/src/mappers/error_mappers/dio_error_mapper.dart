part of 'error_mapper.dart';

extension _DioErrorMapper on DioException {
  static const String kConnectionRefusedError = 'Connection refused';
  ErrorModel asErrorModel() {
    final errorLogDetails = _mapToErrorLogDetails(); // TODO: Handle details

    if (type == DioExceptionType.badResponse && response != null) {
      if (response!.statusCode == 500) {
        try {
          // TODO: create error model from response
        } catch (e) {
          return ServerErrorModel(errorLogDetails);
        }
      }

      if (response!.statusCode == 403) {
        return AccessDeniedErrorModel(errorLogDetails);
      }

      if (response!.statusCode == 404) {
        return NotFoundErrorModel(
          message: response!.mapToString(),
          errorLogDetails: errorLogDetails,
        );
      }

      if (response!.statusCode == 422) {
        return ErrorServerGenericModel(
          message: response!.mapToString(),
          errorLogDetails: errorLogDetails,
        );
      }
    }

    if (type == DioExceptionType.unknown && error is SocketException) {
      final errorCode = (error as SocketException).osError?.errorCode;
      if (errorCode == 101) {
        return NoConnectionErrorModel(errorLogDetails);
      }
      final errorMessage = (error as SocketException).osError?.message ?? '';
      if (errorMessage.contains(kConnectionRefusedError)) {
        return ConnectionRefusedErrorModel(errorLogDetails);
      }
    }

    return NetworkErrorModel(errorLogDetails);
  }

  Map<String, String> _mapToErrorLogDetails() {
    final endpoint = '${requestOptions.baseUrl}${requestOptions.path}';

    //request headers
    final contentType =
        requestOptions.headers[HttpHeaders.contentTypeHeader] ?? '';

    //response headers
    final responseContentType =
        response?.headers[HttpHeaders.contentTypeHeader] ?? '';

    final responseBody = response?.data ?? '';
    final statusCode = response?.statusCode.toString() ?? '';

    final Map<String, dynamic> requestHeaders = {
      'content-type': contentType,
    };
    final Map<String, dynamic> responseHeaders = {
      'content-type': responseContentType,
    };

    return {
      kErrorLogEndpoint: endpoint,
      kErrorLogStatusCode: statusCode,
      kErrorLogRequestHeaders: requestHeaders.toString(),
      kErrorLogResponseHeaders: responseHeaders.toString(),
      kErrorLogResponseBody: responseBody.toString(),
    };
  }
}
