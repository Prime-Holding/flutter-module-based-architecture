import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/src/lib_pin_code/domain//services/update_pin_code_service.dart';

import 'update_pin_code_service_mock.mocks.dart';

@GenerateMocks([UpdatePinCodeService])
UpdatePinCodeService updatePinCodeServiceMockFactory({
  bool showBiometricsButton = false,
}) {
  final mockUpdatePinCodeService = MockUpdatePinCodeService();

  when(mockUpdatePinCodeService.getPinLength()).thenAnswer((_) async => 4);

  when(mockUpdatePinCodeService.getPinCode()).thenAnswer((_) async => '1234');

  return mockUpdatePinCodeService;
}
