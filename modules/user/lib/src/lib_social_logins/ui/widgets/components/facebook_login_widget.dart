// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

import '../../../data/data_sources/facebook_auth_data_source.dart';
import '../../../data/data_sources/facebook_credential_data_source.dart';
import '../../../data/repositories/facebook_auth_repository.dart';
import '../../../domain/services/facebook_social_login_service.dart';
import '../../../domain/services/social_login_service.dart';
import '../../blocs/social_login_bloc.dart';
import 'social_login_button.dart';

/// [FacebookLoginWidget] provides out of the box Log in with Apple
/// functionality along with default view of the button.
///
/// If an error occur a modal sheet with message will be shown. For custom error
/// handling provide [onError] callback.
class FacebookLoginWidget extends StatelessWidget {
  const FacebookLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final current = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppErrorModalWidget<SocialLoginBlocType>(
          errorState: (bloc) => bloc.states.errors,
        ),
        RxBlocBuilder<SocialLoginBlocType, bool>(
          state: (bloc) => bloc.states.isLoading,
          builder: (context, snapshot, bloc) => SocialLoginButton(
            isLoading: (snapshot.data ?? false) ? false : true,
            backgroundColor: context.designSystem.colors.facebookBackground,
            text: context.l10n.featureLogin.facebookLogin,
            textStyle: context.designSystem.typography.facebookButtonText,
            progressIndicatorColor:
                context.designSystem.colors.facebookTextColor,
            onPressed:
                (snapshot.data ?? false) ? null : () => bloc.events.login(),
            child: SvgPicture.asset(
              context.designSystem.images.facebookLogo,
              colorFilter: ColorFilter.mode(
                context.designSystem.colors.facebookTextColor,
                BlendMode.srcIn,
              ),
              height: context.designSystem.spacing.xl,
            ),
          ),
        ),
      ],
    );

    if (isInTestMode) {
      return current;
    }

    return MultiProvider(
      providers: [
        ..._dataSources,
        ..._repositories,
        ..._services,
        ..._blocs,
      ],
      child: current,
    );
  }

  List<Provider> get _dataSources => [
        Provider<FacebookAuthDataSource>(
            create: (context) =>
                FacebookAuthDataSource(context.read<ApiHttpClient>())),
        Provider<FacebookCredentialDataSource>(
            create: (context) => FacebookCredentialDataSource()),
      ];

  List<Provider> get _repositories => [
        Provider<FacebookAuthRepository>(
          create: (context) => FacebookAuthRepository(
            context.read(),
            context.read(),
            context.read(),
          ),
        )
      ];
  List<Provider> get _services => [
        Provider<SocialLoginService>(
          create: (context) => FacebookAuthService(
            context.read(),
            context.read(),
          ),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<SocialLoginBlocType>(
          create: (context) => SocialLoginBloc(
            context.read(),
            context.read(),
          ),
        ),
      ];
}
