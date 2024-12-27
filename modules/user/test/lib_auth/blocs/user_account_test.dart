import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:shared/shared.dart';
import 'package:user/src/lib_auth/ui/blocs/user_account_bloc.dart';
import 'package:user/src/lib_auth/domain/models/auth_token_model.dart';
import 'package:user/src/lib_auth/domain/services/auth_service.dart';
import 'package:user/src/lib_auth/domain/services/user_account_service.dart';

import '../mock/auth_service_mock.dart';
import '../mock/user_account_service_mock.dart';
import '../stubs.dart';
import '../../../../../shared/test/blocs/router_bloc_mock.dart';
import '../../../../../shared/test/blocs/coordinator_bloc_mock.dart';

void main() {
  late UserAccountService userAccountService;
  late CoordinatorBlocType coordinatorBloc;
  late AuthService authService;
  late CoordinatorStates coordinatorStates;

  void defineWhen(
      {String? username,
      String? password,
      AuthTokenModel? authToken,
      isAuthenticated}) {
    when(userAccountService.logout()).thenAnswer((_) => Future.value());

    when(userAccountService.loadPermissions())
        .thenAnswer((_) => Future.value());

    if (username != null && password != null) {
      when(userAccountService.login(username: username, password: password))
          .thenAnswer((_) => Future.value());
    }

    if (authToken != null) {
      when(userAccountService.saveTokens(authToken))
          .thenAnswer((_) => Future.value());
    }

    when(userAccountService.subscribeForNotifications())
        .thenAnswer((_) => Future.value());

    when(authService.isAuthenticated())
        .thenAnswer((_) => Future.value(isAuthenticated));

    when(authService.logout()).thenAnswer((_) => Future.value());

    when(authService.clearAuthData()).thenAnswer((_) => Future.value());

    when(authService.fetchNewToken())
        .thenAnswer((_) => Future.value(Stubs.authTokenModel));

    when(authService.getRefreshToken())
        .thenAnswer((_) => Future.value(Stubs.refreshToken));

    when(authService.getToken())
        .thenAnswer((_) => Future.value(Stubs.authToken));

    when(authService.saveRefreshToken(Stubs.refreshToken))
        .thenAnswer((_) => Future.value());

    when(authService.saveToken(Stubs.authToken))
        .thenAnswer((_) => Future.value());

    when(authService.authenticate(email: username, password: password))
        .thenAnswer((_) => Future.value(Stubs.authTokenModel));

    when(coordinatorStates.isAuthenticated)
        .thenAnswer((_) => Stream.value(isAuthenticated));
  }

  UserAccountBloc bloc() => UserAccountBloc(
        userAccountService,
        coordinatorBloc,
        authService,
        routerBlocMockFactory(),
      );

  setUp(() {
    coordinatorStates = coordinatorStatesMockFactory();

    userAccountService = userAccountServiceMockFactory();
    authService = authServiceMockFactory();
    coordinatorBloc = coordinatorBlocMockFactory(states: coordinatorStates);
  });

  rxBlocTest<UserAccountBlocType, bool>(
      'test user_account_test_dart state loggedIn',
      build: () async {
        defineWhen(isAuthenticated: false);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.logout();
      },
      state: (bloc) => bloc.states.loggedIn,
      expect: [false]);

  rxBlocTest<UserAccountBlocType, bool>(
      'test user_account_test_dart state isLoading',
      build: () async {
        defineWhen(isAuthenticated: false);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.logout();
      },
      state: (bloc) => bloc.states.isLoading,
      expect: [false]);
}
