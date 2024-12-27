import 'package:mockito/annotations.dart';
import 'package:user/src/lib_auth/domain/services/user_account_service.dart';

import '../../feature_login/blocs/login_test.mocks.dart';

@GenerateMocks([
  UserAccountService,
])
UserAccountService userAccountServiceMockFactory() => MockUserAccountService();
