import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:user/src/feature_login/ui/blocs/login_bloc.dart';
import 'package:user/src/feature_login/ui/widgets/login_page.dart';
import 'package:user/src/lib_social_logins/ui/blocs/social_login_bloc.dart';

import '../mock/login_mock.dart';
import '../mock/social_login_mock.dart';

/// Change the parameters according the the needs of the test
Widget loginFactory({
  String? email,
  String? password,
  bool? loggedIn,
  bool? showErrors,
  bool? isLoading,
  ErrorModel? errors,
}) => Scaffold(
  body: MultiProvider(
    providers: [
      RxBlocProvider<LoginBlocType>.value(
        value: loginMockFactory(
          email: email,
          password: password,
          loggedIn: loggedIn,
          showErrors: showErrors,
          isLoading: isLoading,
          errors: errors,
        ),
      ),
      RxBlocProvider<SocialLoginBlocType>.value(
        value: socialLoginMockFactory(
          loggedIn: loggedIn,
          isLoading: isLoading,
          errors: errors,
        ),
      ),
    ],
    child: const LoginPage(),
  ),
);
