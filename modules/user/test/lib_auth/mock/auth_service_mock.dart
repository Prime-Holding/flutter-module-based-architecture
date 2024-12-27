import 'package:mockito/annotations.dart';
import 'package:user/src/lib_auth/domain/services/auth_service.dart';

import 'auth_service_mock.mocks.dart';

@GenerateMocks([
  AuthService,
])
AuthService authServiceMockFactory() => MockAuthService();
