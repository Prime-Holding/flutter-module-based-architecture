// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/routes.dart';
import 'package:shared/shared.dart';

import '../../domain/services/auth_service.dart';
import '../../domain/services/user_account_service.dart';

part 'user_account_bloc.rxb.g.dart';

abstract class UserAccountBlocEvents {
  /// The event is called on user logout.
  void logout();
}

abstract class UserAccountBlocStates {
  /// The state is updated when the user authentication state is changed.
  ConnectableStream<bool> get loggedIn;

  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;
}

@RxBloc()
class UserAccountBloc extends $UserAccountBloc {
  UserAccountBloc(
    this._userAccountService,
    this._coordinatorBloc,
    this._authService,
    this._routerBloc,
  ) {
    loggedIn.connect().addTo(_compositeSubscription);

    _$logoutEvent
        .throttleTime(const Duration(seconds: 1))
        .exhaustMap((value) =>
            _userAccountService.logout().then((_) => false).asResultStream())
        .setResultStateHandler(this)
        .whereSuccess()
        .emitAuthenticatedToCoordinator(_coordinatorBloc)
        .emitOtpConfirmedToCoordinator(_coordinatorBloc)
        .emitLoggedOutToCoordinator(_coordinatorBloc)
        .emitPinCodeConfirmedToCoordinator(_coordinatorBloc)
        .doOnData((_) => _routerBloc.events.go(LoginRoute()))
        .listen(null)
        .addTo(_compositeSubscription);
  }

  final UserAccountService _userAccountService;
  final CoordinatorBlocType _coordinatorBloc;
  final AuthService _authService;
  final RouterBlocType _routerBloc;

  @override
  ConnectableStream<bool> _mapToLoggedInState() => Rx.merge([
        _coordinatorBloc.states.isAuthenticated,
        _authService.isAuthenticated().asStream(),
      ]).doOnData((isUserLoggedIn) {
        if (isUserLoggedIn) {
          _coordinatorBloc.events.checkUserLoggedIn();
        }
      }).publishReplay(maxSize: 1);

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;
}
