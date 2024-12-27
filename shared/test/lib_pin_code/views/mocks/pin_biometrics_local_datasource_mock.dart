import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/src/lib_pin_code/data/data_source/pin_biometrics_local_data_source.dart';

import 'pin_biometrics_local_datasource_mock.mocks.dart';

@GenerateMocks([PinBiometricsLocalDataSource])
PinBiometricsLocalDataSource pinBiometricsLocalDataSourceMockFactory(
    bool showBiometricsButton) {
  final mockPinBiometricsLocalDataSource = MockPinBiometricsLocalDataSource();

  when(mockPinBiometricsLocalDataSource.areBiometricsEnabled())
      .thenAnswer((_) async => showBiometricsButton);

  return mockPinBiometricsLocalDataSource;
}
