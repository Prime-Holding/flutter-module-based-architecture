import 'package:shared/shared.dart';

class Stubs {
  static const email = 'something@test.com';

  static const password = 'password';

  static final error = FieldErrorModel(
    errorValue: S.current.invalidEmail,
    fieldValue: email,
  );
}
