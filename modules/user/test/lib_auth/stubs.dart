import 'package:user/src/lib_auth/domain/models/auth_token_model.dart';

class Stubs {
  static const email = 'someone@email.com';

  static const password = 'secret';

  static const authToken = 'sometoken';

  static const refreshToken = 'somerefreshtoken';

  static final authTokenModel = AuthTokenModel(authToken, refreshToken);
}
