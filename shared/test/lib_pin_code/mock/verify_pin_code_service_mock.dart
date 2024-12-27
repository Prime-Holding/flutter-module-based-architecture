import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/src/lib_pin_code/domain/services/verify_pin_code_service.dart';

import 'verify_pin_code_service_mock.mocks.dart';

@GenerateMocks([VerifyPinCodeService])
VerifyPinCodeService verifyPinCodeServiceMockFactory({
  bool showBiometricsButton = false,
}) {
  final mockVerifyPinCodeService = MockVerifyPinCodeService();

  when(mockVerifyPinCodeService.getPinLength()).thenAnswer((_) async => 4);

  when(mockVerifyPinCodeService.getPinCode()).thenAnswer((_) async => '1234');

  return mockVerifyPinCodeService;
}
