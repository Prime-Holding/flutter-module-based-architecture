// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../data/data_source/pin_biometrics_local_data_source.dart';

class PinBiometricsRepository {
  PinBiometricsRepository(this._pinBiometricsLocalDataSource);

  final BiometricsLocalDataSource _pinBiometricsLocalDataSource;

  Future<bool> areBiometricsEnabled() =>
      (_pinBiometricsLocalDataSource as PinBiometricsLocalDataSource)
          .areBiometricsEnabled();

  Future<void> setBiometricsEnabled(bool enable) =>
      (_pinBiometricsLocalDataSource as PinBiometricsLocalDataSource)
          .setBiometricsEnabled(enable);
}
