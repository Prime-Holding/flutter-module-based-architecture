import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/lib_pin_code/data/repository/pin_code_repository.dart';
import 'package:shared/src/lib_pin_code/domain/services/verify_pin_code_service.dart';

import '../stubs.dart';
import 'create_pin_code_service_test.mocks.dart';

@GenerateMocks([PinCodeRepository])
void main() {
  late MockPinCodeRepository repository;
  late CreatePinCodeService permissionsService;

  setUp(() {
    repository = MockPinCodeRepository();
    permissionsService = CreatePinCodeService(repository);
  });

  tearDown(() {
    reset(repository);
  });

  group('CreatePinCodeService', () {
    test('deleteStoredPin should call repository.writePinToStorage with null',
        () async {
      when(repository.getPinCode()).thenAnswer((_) async => null);

      final result = await permissionsService.deleteStoredPin();

      expect(result, true);
      verify(repository.writePinToStorage(VerifyPinCodeService.storedPin, null))
          .called(1);
      verify(repository.getPinCode()).called(1);
    });

    test('checkIsPinCreated should return false', () async {
      when(repository.getPinCode()).thenAnswer((_) async => null);

      final result = await permissionsService.checkIsPinCreated();

      expect(result, false);
      verify(repository.getPinCode()).called(1);
    });

    test('checkIsPinCreated should return true', () async {
      when(repository.getPinCode()).thenAnswer((_) async => Stubs.pin);

      final result = await permissionsService.checkIsPinCreated();

      expect(result, true);
      verify(repository.getPinCode()).called(1);
    });

    test('getPinLength should return length', () async {
      const pinLength = Stubs.pin.length;

      when(repository.getPinLength()).thenAnswer((_) async => pinLength);

      final result = await permissionsService.getPinLength();

      expect(result, pinLength);
      verify(repository.getPinLength()).called(1);
    });

    test('getPinLength should return length', () async {
      const pinLength = Stubs.pin.length;

      when(repository.getPinLength()).thenAnswer((_) async => pinLength);

      final result = await permissionsService.getPinLength();

      expect(result, pinLength);
      verify(repository.getPinLength()).called(1);
    });

    test('getPinCode should return pin', () async {
      const pin = Stubs.pin;

      when(repository.getPinCode()).thenAnswer((_) async => pin);

      final result = await permissionsService.getPinCode();

      expect(result, pin);
      verify(repository.getPinCode()).called(1);
    });
  });
}
