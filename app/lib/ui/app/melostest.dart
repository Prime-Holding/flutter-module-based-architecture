// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:provider/provider.dart';
import 'package:shared/routes.dart' as routes;
import 'package:shared/shared.dart';
import 'package:user/user.dart';
import 'package:widget_toolkit/language_picker.dart';

import '../../lib_dev_menu/ui/widgets/components/app_dev_menu_gesture_detector_with_dependencies.dart';
import '../../lib_router/ui/router.dart';
import '../di/melostest_with_dependencies.dart';
import '../utils/dev_menu.dart';
import 'initialization/firebase_messaging_callbacks.dart';

/// This widget is the root of your application.
class Melostest extends StatelessWidget {
  const Melostest({
    this.config = EnvironmentConfig.production,
    this.createDevMenuInstance,
    super.key,
  });

  final EnvironmentConfig config;

  final CreateDevMenuInstance? createDevMenuInstance;

  @override
  Widget build(BuildContext context) => MelostestWithDependencies(
        config: config,
        child: _MyMaterialApp(config, createDevMenuInstance),
      );
}

/// Wrapper around the MaterialApp widget to provide additional functionality
/// accessible throughout the app (such as App-level dependencies, Firebase
/// services, etc).
class _MyMaterialApp extends StatefulWidget {
  const _MyMaterialApp(
    this.config,
    this.createDevMenuInstance,
  );

  final EnvironmentConfig config;
  final CreateDevMenuInstance? createDevMenuInstance;

  @override
  __MyMaterialAppState createState() => __MyMaterialAppState();
}

class __MyMaterialAppState extends State<_MyMaterialApp> {
  Locale? _locale;

  late StreamSubscription<LanguageModel> _languageSubscription;
  late SessionConfig _sessionConfig;

  // ignore: unused_field
  late AnalyticsBlocType _analyticsBloc;

  @override
  void initState() {
    _createSessionConfig();

    _updateLocale();
    _configureFCM();

    _configureAnalyticsAndCrashlytics();

    _configureInterceptors();
    super.initState();
  }

  void _createSessionConfig() {
    context.read<UpdateAndVerifyPinBlocType>().events.deleteSavedData();
    _sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(seconds: 60),
      invalidateSessionForUserInactivity: const Duration(seconds: 7),
    );
    context
        .read<UpdateAndVerifyPinBlocType>()
        .events
        .setSessionState(SessionState.startListening);
    _userInactivityListeners();
  }

  void _userInactivityListeners() {
    _sessionConfig.stream.listen((timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout ||
          timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        if (mounted) {
          context.read<RouterBlocType>().events.go(
                routes.VerifyPinCodeRoute(),
                extra: const PinCodeArguments(title: 'Enter Pin Code'),
              );
        }
      }
    });
  }

  void _updateLocale() {
    _languageSubscription = context
        .read<ChangeLanguageBlocType>()
        .states
        .currentLanguage
        .listen((language) {
      setState(
        () => _locale = Locale(language.locale),
      );
    });
  }

  @override
  void dispose() {
    _languageSubscription.cancel();
    super.dispose();
  }

  Future<void> _configureFCM() async {
    /// Initialize the FCM callbacks
    if (kIsWeb) {
      await safeRun(
          () => FirebaseMessaging.instance.getToken(vapidKey: webVapidKey));
    }

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    await onInitialMessageOpened(initialMessage);

    FirebaseMessaging.instance.onTokenRefresh
        .listen((token) => onFCMTokenRefresh(token));

    FirebaseMessaging.onMessage.listen((message) {
      if (mounted) {
        onForegroundMessage(context, message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (mounted) {
        onMessageOpenedFromBackground(context, message);
      }
    });
  }

  void _configureAnalyticsAndCrashlytics() {
    // Currently we only need to have a reference to an analytics bloc instance
    // since it's not exposing any events or states and all operations
    // are performed through its internal subscriptions.
    _analyticsBloc = context.read();
  }

  void _configureInterceptors() {
    context.read<PlainHttpClient>().configureInterceptors(
          AnalyticsInterceptor(context.read()),
        );

    context.read<ApiHttpClient>().configureInterceptors(
          //TODO: Create an instance of the AuthInterceptor

          AnalyticsInterceptor(context.read()),
        );

    context.read<ApiHttpClient>().interceptors.add(
          AuthInterceptor(
            context.read<ApiHttpClient>(),
            context.read(),
            context.read(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final materialApp = _buildMaterialAppWithPinCode();

    if (EnvironmentConfig.enableDevMenu) {
      return AppDevMenuGestureDetectorWithDependencies(
        navigatorKey: AppRouter.rootNavigatorKey,
        child: materialApp,
      );
    }

    return materialApp;
  }

  Widget _buildMaterialAppWithPinCode() =>
      RxBlocBuilder<CreatePinBlocType, bool>(
        state: (bloc) => bloc.states.isPinCreated,
        builder: (context, isPinCreated, bloc) =>
            RxBlocBuilder<UserAccountBlocType, bool>(
          state: (bloc) => bloc.states.loggedIn,
          builder: (context, loggedIn, bloc) {
            if (loggedIn.hasData) {
              if (!loggedIn.data!) {
                // If user logs out, set stopListening
                context
                    .read<UpdateAndVerifyPinBlocType>()
                    .events
                    .setSessionState(SessionState.stopListening);
                return _buildMaterialApp(context);
              }
              if ((loggedIn.data!) &&
                  (isPinCreated.hasData && isPinCreated.data!)) {
                context
                    .read<UpdateAndVerifyPinBlocType>()
                    .events
                    .setSessionState(SessionState.startListening);

                return SessionTimeoutManager(
                    userActivityDebounceDuration: const Duration(seconds: 2),
                    sessionConfig: _sessionConfig,
                    sessionStateStream: context
                        .read<UpdateAndVerifyPinBlocType>()
                        .states
                        .sessionValue,
                    child: _buildMaterialApp(context));
              }
            }
            return _buildMaterialApp(context);
          },
        ),
      );

  Widget _buildMaterialApp(BuildContext context) => MaterialApp.router(
        title: 'Melostest',
        theme: DesignSystemTheme.buildTheme(DesignSystem.light()),
        darkTheme: DesignSystemTheme.buildTheme(DesignSystem.dark()),
        localizationsDelegates: const [
          AppI18n.delegate,
          // ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: I18n.supportedLocales,
        locale: _locale,
        routerConfig: context.read<AppRouter>().router,
        debugShowCheckedModeBanner: false,
      );
}
