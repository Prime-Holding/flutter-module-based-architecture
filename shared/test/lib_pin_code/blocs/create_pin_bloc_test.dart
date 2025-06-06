import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:shared/shared.dart';

import '../../blocs/coordinator_bloc_mock.dart';
import '../mock/create_pin_code_service_mock.dart';

void main() {
  late CoordinatorBlocType coordinatorBloc;
  late CreatePinCodeService createPinCodeService;
  late CoordinatorStates coordinatorStates;
  late CoordinatorEvents coordinatorEvents;

  void defineWhen({
    String? pinCode,
    String? encryptedPinCode,
    bool isPinCorrect = false,
    bool isPinCreated = false,
    bool isPinCodeInSecureStorage = false,
    bool isPinDeleted = false,
  }) {
    when(coordinatorStates.userLoggedIn)
        .thenAnswer((_) => const Stream.empty());

    when(coordinatorStates.userLogOut).thenAnswer((_) => Stream.value(null));

    when(createPinCodeService.deleteStoredPin())
        .thenAnswer((_) => Future.value(isPinDeleted));

    when(createPinCodeService.checkIsPinCreated())
        .thenAnswer((_) => Future.value(isPinCreated));

    if (pinCode != null) {
      if (encryptedPinCode != null) {
        when(createPinCodeService.encryptPinCode(pinCode))
            .thenAnswer((_) => Future.value(encryptedPinCode));
      }

      when(createPinCodeService.getPinLength())
          .thenAnswer((_) => Future.value(pinCode.length));

      when(createPinCodeService.verifyPinCode(pinCode))
          .thenAnswer((_) => Future.value(isPinCorrect));

      when(createPinCodeService.getPinCode())
          .thenAnswer((_) => Future.value(pinCode));
    }
  }

  CreatePinBloc bloc() => CreatePinBloc(
      service: createPinCodeService, coordinatorBloc: coordinatorBloc);

  setUp(() {
    coordinatorStates = coordinatorStatesMockFactory();
    coordinatorEvents = coordinatorEventsMockFactory();
    createPinCodeService = createPinCodeServiceMockFactory();
    coordinatorBloc = coordinatorBlocMockFactory(
        states: coordinatorStates, events: coordinatorEvents);
  });

  rxBlocTest<CreatePinBlocType, bool>(
      'test create_pin_bloc_test state isPinCreated true',
      build: () async {
        defineWhen(isPinCreated: true);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.checkIsPinCreated();
      },
      state: (bloc) => bloc.states.isPinCreated,
      expect: [true]);

  rxBlocTest<CreatePinBlocType, bool>(
      'test create_pin_bloc_test state isPinCreated false',
      build: () async {
        defineWhen(isPinCreated: true);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.checkIsPinCreated();
      },
      state: (bloc) => bloc.states.isPinCreated,
      expect: [true]);

  rxBlocTest<CreatePinBlocType, bool>(
      'test create_pin_bloc_test state deleteStoredPinData true',
      build: () async {
        defineWhen(isPinDeleted: true);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.deleteSavedData();
      },
      state: (bloc) => bloc.states.deleteStoredPinData,
      expect: [true]);

  rxBlocTest<CreatePinBlocType, bool>(
      'test create_pin_bloc_test state deleteStoredPinData false',
      build: () async {
        defineWhen(isPinDeleted: false);
        return bloc();
      },
      act: (bloc) async {
        bloc.events.deleteSavedData();
      },
      state: (bloc) => bloc.states.deleteStoredPinData,
      expect: [false]);
}
