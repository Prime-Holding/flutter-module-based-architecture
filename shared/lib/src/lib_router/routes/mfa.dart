part of '../routes.dart';

class MfaOtpRoute extends AppRoute with EquatableMixin {
  MfaOtpRoute({required this.transactionId});

  final String transactionId;

  @override
  List<Object?> get props => [transactionId];
}

class MfaPinBiometricsRoute extends AppRoute with EquatableMixin {
  MfaPinBiometricsRoute({required this.transactionId});

  final String transactionId;

  @override
  List<Object?> get props => [transactionId];
}

class FeatureMfaRoute extends AppRoute {}

class FeatureMfaKoceRoute extends AppRoute {}
