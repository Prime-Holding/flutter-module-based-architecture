import '../../domain/models/response_models/sse_message_model.dart';
import '../../data/repositries/sse_repository.dart';

class SseService {
  SseService(this._repository);

  final SseRepository _repository;

  Stream<SseMessageModel> getEventStream() => _repository.getEventStream();
}
