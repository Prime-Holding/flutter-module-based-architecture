import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/domain/models/response_models/sse_message_model.dart';

class Stubs {
  static const addIcon = Icon(Icons.add);

  static const removeIcon = Icon(Icons.remove);

  static const tooltip = 'This is a tooltip';

  static const appBarTitle = 'Some title';

  static const submit = 'Submit';

  static const customColor = Color.fromRGBO(100, 100, 100, 1);

  static final unknownError =
      UnknownErrorModel(exception: Exception('Some error occur'));

  static const sseMessageModel = SseMessageModel(
    id: '1',
    data: 'Some message',
    event: 'event Name',
    retry: 1000,
  );
}
