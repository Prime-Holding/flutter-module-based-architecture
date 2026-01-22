part of 'error_model.dart';

class ConnectionRefusedErrorModel extends ErrorModel {
  ConnectionRefusedErrorModel([super.errorLogDetails]);

  String get message => S.current.connectionRefused;

  @override
  String toString() => 'ConnectionRefusedError.';
}
