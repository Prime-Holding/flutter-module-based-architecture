// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';

import '../../base/models/count.dart';
import '../services/counter_service.dart';

part 'counter_bloc.rxb.g.dart';

/// A contract class containing all events.
abstract class CounterBlocEvents {
  /// Increment the count
  void increment();

  /// Decrement the count
  void decrement();

  /// Get the current count
  void reload();
}

/// A contract class containing all states for our multi state BloC.
abstract class CounterBlocStates {
  /// Loading state of the bloc
  ///
  /// It is true when the bloc is waiting for the repository to returns data
  /// or throws an Exception
  Stream<LoadingWithTag> get isLoading;

  /// Error state of the bloc
  ///
  /// Emits an error message, when the repository throws an Exception
  Stream<ErrorModel> get errors;

  /// The count of the Counter
  ///
  /// It can be controlled by executing [CounterBlocEvents.increment] and
  /// [CounterBlocEvents.decrement]
  ///
  Stream<int> get count;
}

/// A BloC responsible for count calculations
@RxBloc()
class CounterBloc extends $CounterBloc {
  /// Bloc constructor
  CounterBloc(this._service);

  final CounterService _service;

  /// Increment action
  static const tagIncrement = 'Increment';

  /// Decrement action
  static const tagDecrement = 'Decrement';

  /// Reload action
  static const tagReload = 'Reload';

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<LoadingWithTag> _mapToIsLoadingState() => loadingWithTagState;

  @override
  Stream<int> _mapToCountState() => Rx.merge<Result<Count>>([
        // On increment.
        _$incrementEvent.switchMap(
            (_) => _service.increment().asResultStream(tag: tagIncrement)),
        // On decrement.
        _$decrementEvent.switchMap(
            (_) => _service.decrement().asResultStream(tag: tagDecrement)),
        // Get current value
        _$reloadEvent.startWith(null).switchMap(
            (_) => _service.getCurrent().asResultStream(tag: tagReload)),
      ])
          .setResultStateHandler(this)
          .whereSuccess()
          .map((event) => event.value)
          .shareReplay(maxSize: 1);
}
