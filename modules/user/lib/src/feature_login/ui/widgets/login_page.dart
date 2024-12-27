// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io' show Platform;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../lib_social_logins/ui/widgets/components/apple_login_widget.dart';
import '../../../lib_social_logins/ui/widgets/components/facebook_login_widget.dart';
import '../../../lib_social_logins/ui/widgets/components/google_login_widget.dart';
import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(
          context,
          title: context.l10n.featureLogin.loginPageTitle,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.designSystem.spacing.xxl2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginForm(
                  title: context.l10n.featureLogin.loginCredentialsHint,
                ),
                SizedBox(height: context.designSystem.spacing.xs),
                const FacebookLoginWidget(),
                if (Platform.isIOS)
                  Column(
                    children: [
                      SizedBox(height: context.designSystem.spacing.xs),
                      const AppleLoginWidget(),
                    ],
                  ),
                SizedBox(height: context.designSystem.spacing.xs),
                const GoogleLoginWidget(),
              ],
            ),
          ),
        ),
      );
}
