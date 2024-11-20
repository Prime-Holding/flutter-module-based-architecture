import 'package:equatable/equatable.dart';

part 'routes/showcases.dart';
part 'routes/mfa.dart';
part 'routes/onboarding.dart';
part 'routes/profile.dart';

sealed class AppRoute {}

class SplashRoute extends AppRoute {}

class DashboardRoute extends AppRoute {}
