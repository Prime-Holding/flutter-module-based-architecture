import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:user/src/lib_auth/domain/services/access_token_service.dart';
import 'package:user/src/lib_auth/domain/services/auth_service.dart';

import '../mock/auth_service_mock.mocks.dart';
import '../stubs.dart';

@GenerateMocks([AuthService])
void main() {
  late MockAuthService authService;
  late AccessTokenService accessTokenService;

  setUp(() {
    authService = MockAuthService();
    accessTokenService = AccessTokenService(authService);
  });

  tearDown(() {
    reset(authService);
  });

  group('AccessTokenService', () {
    test('getAccessToken should return token', () async {
      const token = Stubs.authToken;
      when(authService.getToken()).thenAnswer((_) async => token);

      final result = await accessTokenService.getAccessToken();

      expect(result, token);
      verify(authService.getToken()).called(1);
    });

    test('refreshAccessToken should return token', () async {
      final authTokenModel = Stubs.authTokenModel;
      when(authService.fetchNewToken()).thenAnswer((_) async => authTokenModel);

      final result = await accessTokenService.refreshAccessToken();

      expect(result, authTokenModel.token);
      verify(authService.fetchNewToken()).called(1);
      verify(authService.saveToken(authTokenModel.token)).called(1);
      verify(authService.saveRefreshToken(authTokenModel.refreshToken))
          .called(1);
    });
  });
}
