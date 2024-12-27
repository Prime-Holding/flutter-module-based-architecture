// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:shared/shared.dart';

import '../../domain/models/count.dart';

import '../data_sources/remote/count_remote_data_source.dart';

// Decouple Data Layer and Business Logic Layer
class CounterRepository {
  CounterRepository(this._errorMapper, this._countRemoteDataSource);

  final ErrorMapper _errorMapper;
  final CountRemoteDataSource _countRemoteDataSource;

  /// Fetch current value of the counter
  Future<Count> getCurrent() =>
      _errorMapper.execute(() => _countRemoteDataSource.getCurrent());

  /// Fetch incremented value of the counter
  Future<Count> increment() =>
      _errorMapper.execute(() => _countRemoteDataSource.increment());

  /// Fetch decremented value of the counter
  Future<Count> decrement() =>
      _errorMapper.execute(() => _countRemoteDataSource.decrement());
}
