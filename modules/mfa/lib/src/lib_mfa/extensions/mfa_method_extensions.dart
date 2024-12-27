import 'package:shared/routes.dart';

import '../domain/models/mfa_method.dart';

extension MfaMethodX on MfaMethod {
  /// Returns a [RouteDataModel] object based on the [MfaMethod] type.
  ///
  /// The route must be on a root level such as /mfa/pin-biometrics/:transactionId
  ///
  /// - [transactionId] is the transaction id to be used in the route
  /// - if the [MfaMethod] is [MfaMethod.complete] it will return null.
  AppRoute? createMfaMethodRoute(String transactionId) {
    switch (this) {
      case MfaMethod.pinBiometric:
        return MfaPinBiometricsRoute(transactionId: transactionId);
      case MfaMethod.otp:
        return MfaOtpRoute(transactionId: transactionId);
      case MfaMethod.complete:
        return null;
    }
  }
}
