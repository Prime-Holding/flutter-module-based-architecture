// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../../base/models/count.dart';
import '../../base/repositories/counter_repository.dart';

class CounterService {
  CounterService(this._repository);

  final CounterRepository _repository;

  Future<Count> getCurrent() => _repository.getCurrent();

  Future<Count> increment() => _repository.increment();

  Future<Count> decrement() => _repository.decrement();
}
