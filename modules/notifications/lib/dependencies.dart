import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:provider/provider.dart' show Provider, ReadContext;
import 'package:provider/single_child_widget.dart';
import 'package:shared/shared.dart';

import 'src/data/data_sources/local/notifications_local_data_source.dart';
import 'src/data/data_sources/remote/push_notification_data_source.dart';
import 'src/data/repositories/push_notification_repository.dart';
import 'src/domain/services/push_notifications_service.dart';

List<SingleChildWidget> get dependencies => [
      ..._dataSources,
      ..._repositories,
      ..._services,
    ];

List<SingleChildWidget> get _dataSources => [
      Provider<NotificationsLocalDataSource>(
        create: (context) => NotificationsLocalDataSource(context.read()),
      ),
      Provider<PushNotificationsDataSource>(
        create: (context) => PushNotificationsDataSource(
          context.read<ApiHttpClient>(),
        ),
      ),
      Provider<FirebaseMessaging>(
        create: (context) => FirebaseMessaging.instance,
      ),
    ];

List<SingleChildWidget> get _repositories => [
      Provider<PushNotificationRepository>(
        create: (context) => PushNotificationRepository(
          context.read(),
          context.read(),
          context.read(),
          context.read(),
        ),
      )
    ];

List<SingleChildWidget> get _services => [
      Provider<PushNotificationsService>(
        create: (context) => PushNotificationsService(
          context.read(),
        ),
      )
    ];
