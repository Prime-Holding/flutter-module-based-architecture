// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../lib_analytics/models/log_event_model.dart';
import '../models/errors/error_model.dart';

part 'coordinator_bloc.rxb.g.dart';

part 'coordinator_bloc_extensions.dart';

abstract class CoordinatorEvents {
  void authenticated({required bool isAuthenticated});

  void otpConfirmed({required bool isOtpConfirmed});

  void pinCodeConfirmed({required bool isPinCodeConfirmed});

  void userLoggedOut();

  void checkUserLoggedIn();

  void errorLogged({
    required ErrorModel error,
    String? stackTrace,
  });

  void navigationChanged(String location);
}

abstract class CoordinatorStates {
  @RxBlocIgnoreState()
  Stream<bool> get isAuthenticated;

  @RxBlocIgnoreState()
  Stream<bool> get isOtpConfirmed;

  @RxBlocIgnoreState()
  Stream<bool> get isPinCodeConfirmed;

  Stream<void> get userLogOut;

  @RxBlocIgnoreState()
  Stream<void> get userLoggedIn;

  @RxBlocIgnoreState()
  Stream<String> get navigationChange;

  Stream<LogEventModel> get errorLogEvent;
}

/// The coordinator bloc manages the communication between blocs.
///
/// The goals is to keep all blocs decoupled from each other
/// as the entire communication flow goes through this bloc.
@RxBloc()
class CoordinatorBloc extends $CoordinatorBloc {
  @override
  Stream<bool> get isAuthenticated => _$authenticatedEvent;

  @override
  Stream<bool> get isOtpConfirmed => _$otpConfirmedEvent;

  @override
  Stream<bool> get isPinCodeConfirmed =>
      _$pinCodeConfirmedEvent.startWith(false);

  @override
  Stream<void> _mapToUserLogOutState() => _$userLoggedOutEvent;

  @override
  Stream<void> get userLoggedIn => _$checkUserLoggedInEvent;

  @override
  Stream<String> get navigationChange => _$navigationChangedEvent;

  @override
  Stream<LogEventModel> _mapToErrorLogEventState() =>
      _$errorLoggedEvent.map((e) => LogEventModel(
            error: e.error,
            stackTrace: e.stackTrace,
          ));
}
