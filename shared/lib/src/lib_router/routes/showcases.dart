part of '../routes.dart';

class ShowcaseRoute extends AppRoute {}

class CounterRoute extends AppRoute {}

class WidgetToolkitRoute extends AppRoute {}

class DeepLinksRoute extends AppRoute {}

class DeepLinkDetailsRoute extends AppRoute {
  DeepLinkDetailsRoute({required this.id});

  final String id;
}

class EnterMessageRoute extends AppRoute {}

class QrCodeRoute extends AppRoute {}

class FeatureOtpRoute extends AppRoute {}
