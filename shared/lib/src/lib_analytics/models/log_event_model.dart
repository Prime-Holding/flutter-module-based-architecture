import 'package:copy_with_extension/copy_with_extension.dart';

import '../../models/errors/error_model.dart';
import 'log_model_tags.dart';

part 'log_event_model.g.dart';

const String kErrorLogEndpoint = 'melostest_endpoint';
const String kErrorLogStatusCode = 'melostest_status_code';
const String kErrorLogRequestHeaders = 'melostest_request_headers';
const String kErrorLogResponseHeaders = 'melostest_response_headers';
const String kErrorLogResponseBody = 'melostest_response_body';
const String kErrorLogSentAt = 'melostest_sent_at';
const String kErrorLogDuration = 'melostest_duration';
const String kErrorLogDetails = 'melostest_error_details';

@CopyWith()
class LogEventModel {
  LogEventModel({
    required this.error,
    this.stackTrace,
    this.context,
    this.errorLogDetails,
  });

  ErrorModel error;
  String? stackTrace;
  LogModelContext? context;
  Map<String, String>? errorLogDetails;

  @override
  String toString() {
    return 'LogEventModel{error: $error, stackTrace: $stackTrace, context: $context, errorLogDetails: $errorLogDetails}';
  }
}
