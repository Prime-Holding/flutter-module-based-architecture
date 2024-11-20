import 'package:shared/shared.dart';

import '../factory/login_factory.dart';
import '../../../../../shared/test/helpers/golden_helper.dart';
import '../../../../../shared/test/helpers/models/scenario.dart';
import '../stubs.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget:
            loginFactory(loggedIn: false, showErrors: false, isLoading: false),
        scenario: Scenario(name: 'login_empty')),
    generateDeviceBuilder(
        widget: loginFactory(email: Stubs.email, password: Stubs.password),
        scenario: Scenario(name: 'login_filled')),
    generateDeviceBuilder(
        widget:
            loginFactory(isLoading: false, loggedIn: true, showErrors: false),
        scenario: Scenario(name: 'login_success')),
    generateDeviceBuilder(
        widget: loginFactory(isLoading: true),
        scenario: Scenario(name: 'login_loading')),
    generateDeviceBuilder(
        widget: loginFactory(
            showErrors: true,
            errors: UnknownErrorModel(
                exception: Exception('Something went wrong'))),
        scenario: Scenario(name: 'login_error'))
  ]);
}
