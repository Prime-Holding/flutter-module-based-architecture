import 'package:mockito/annotations.dart';
import 'package:shared/src/lib_pin_code/domain/services/pin_biometrics_service.dart';

import 'pin_biometrics_service_mock.mocks.dart';

@GenerateMocks([
  PinBiometricsService,
])
PinBiometricsService pinBiometricsServiceMockFactory() =>
    MockPinBiometricsService();
