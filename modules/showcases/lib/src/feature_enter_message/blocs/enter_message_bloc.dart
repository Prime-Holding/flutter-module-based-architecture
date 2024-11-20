// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';

part 'enter_message_bloc.rxb.g.dart';

/// A contract class containing all events of the EnterMessageBloC.
abstract class EnterMessageBlocEvents {
  void setMessage(String? messages);
}

/// A contract class containing all states of the EnterMessageBloC.
abstract class EnterMessageBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;

  Stream<String?> get message;
}

@RxBloc()
class EnterMessageBloc extends $EnterMessageBloc {
  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<String?> _mapToMessageState() => _$setMessageEvent;
}
