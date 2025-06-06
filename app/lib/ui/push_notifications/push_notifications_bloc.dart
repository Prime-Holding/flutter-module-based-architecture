// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:notifications/notifications.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/routes.dart';
import 'package:shared/shared.dart';

part 'push_notifications_bloc.rxb.g.dart';

/// A contract class containing all events of the PushNotificationsBloC.
abstract class PushNotificationsBlocEvents {
  /// Event for handling opening push notifications from background
  /// or from in-app
  void tapOnEvent(NotificationModel event);
}

/// A contract class containing all states of the PushNotificationsBloC.
abstract class PushNotificationsBlocStates {}

@RxBloc()
class PushNotificationsBloc extends $PushNotificationsBloc {
  PushNotificationsBloc(this._routerBloc) {
    _onRedirectingNotification.connect().addTo(_compositeSubscription);
  }

  final RouterBlocType _routerBloc;

  late final ConnectableStream<void> _onRedirectingNotification =
      _$tapOnEventEvent.asyncMap<void>((event) {
    switch (event.type) {
      case NotificationModelType.dashboard:
        return _routerBloc.events.go(DashboardRoute());
      case NotificationModelType.profile:
        return _routerBloc.events.go(ProfileRoute());
      default:
        null;
    }
  }).publish();
}
