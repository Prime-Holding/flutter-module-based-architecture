// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../repository/pin_biometrics_repository.dart';

class PinBiometricsService {
  PinBiometricsService(this._pinBiometricsRepository);

  final PinBiometricsRepository _pinBiometricsRepository;

  Future<bool> areBiometricsEnabled() =>
      _pinBiometricsRepository.areBiometricsEnabled();

  Future<void> setBiometricsEnabled(bool enable) =>
      _pinBiometricsRepository.setBiometricsEnabled(enable);
}
