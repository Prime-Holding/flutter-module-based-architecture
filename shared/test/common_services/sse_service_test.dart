import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/src/data/repositries/sse_repository.dart';
import 'package:shared/src/domain/services/sse_service.dart';

import '../stubs.dart';
import 'sse_service_test.mocks.dart';

@GenerateMocks([SseRepository])
void main() {
  late MockSseRepository repository;
  late SseService service;

  setUp(() {
    repository = MockSseRepository();
    service = SseService(repository);
  });

  tearDown(() {
    reset(repository);
  });

  group('SseService', () {
    test('getEventStream should return sseMessageModel', () async {
      final sseMessageModel = Stream.value(Stubs.sseMessageModel);
      when(repository.getEventStream()).thenAnswer((_) => sseMessageModel);

      final result = service.getEventStream();

      expect(result, sseMessageModel);
      verify(repository.getEventStream()).called(1);
    });
  });
}
