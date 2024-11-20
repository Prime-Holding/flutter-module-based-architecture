import 'package:shared/shared.dart';

class Stubs {
  static const email = 'something@test.com';

  static const password = 'password';

  static final error = FieldErrorModel(
    errorKey: I18nErrorKeys.invalidEmail,
    fieldValue: email,
  );
}
