// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart' hide ErrorModel;

import '../../blocs/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    this.title = 'Enter your login credentials',
    super.key,
  });

  final String title;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailFocusNode = FocusNode(debugLabel: 'emailFocus');
  final _passwordFocusNode = FocusNode(debugLabel: 'passwordFocus');

  /// Get all focus nodes of the form
  List<FocusNode> get _focusNodes => [
        _emailFocusNode,
        _passwordFocusNode,
      ];

  @override
  void dispose() {
// Since the focus nodes are long living object, they should be disposed.
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: context.designSystem.typography.h3Reg14,
            textAlign: TextAlign.center,
          ),
          RxTextFormFieldBuilder<LoginBlocType>(
            state: (bloc) => bloc.states.email.translate(context),
            showErrorState: (bloc) => bloc.states.showErrors,
            onChanged: (bloc, value) => bloc.events.setEmail(value),
            builder: (fieldState) => _buildEmailField(
              fieldState,
              context,
            ),
          ),
          SizedBox(height: context.designSystem.spacing.xs1),
          RxTextFormFieldBuilder<LoginBlocType>(
            state: (bloc) => bloc.states.password.translate(context),
            showErrorState: (bloc) => bloc.states.showErrors,
            onChanged: (bloc, value) => bloc.events.setPassword(value),
            obscureText: true,
            builder: (fieldState) => _buildPasswordField(
              fieldState,
              context,
            ),
          ),
          SizedBox(height: context.designSystem.spacing.xs1),
          RxBlocBuilder<LoginBlocType, bool>(
            state: (bloc) => bloc.states.isLoading,
            builder: _buildLoginButton,
          ),
          AppErrorModalWidget<LoginBlocType>(
            errorState: (bloc) => bloc.states.errors,
          ),
        ],
      );

  TextFormField _buildPasswordField(
    RxTextFormFieldBuilderState<LoginBlocType> fieldState,
    BuildContext context,
  ) =>
      TextFormField(
        key: K.loginPassword,
        obscureText: fieldState.isTextObscured,
        controller: fieldState.controller,
        textInputAction: TextInputAction.done,
        focusNode: _passwordFocusNode,
        onEditingComplete: () => FocusScope.of(context).unfocus(),
        decoration: fieldState.decoration.copyWith(
          labelText: context.l10n.field.password,
        ),
      );

  TextFormField _buildEmailField(
    RxTextFormFieldBuilderState<LoginBlocType> fieldState,
    BuildContext context,
  ) =>
      TextFormField(
        key: K.loginEmail,
        controller: fieldState.controller,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_passwordFocusNode),
        decoration: fieldState.decoration.copyWith(
          labelText: context.l10n.field.email,
        ),
      );

  GradientFillButton _buildLoginButton(
    BuildContext context,
    AsyncSnapshot<bool> loadingState,
    LoginBlocType bloc,
  ) =>
      GradientFillButton(
        key: K.loginButton,
        state: loadingState.isLoading
            ? ButtonStateModel.loading
            : ButtonStateModel.enabled,
        onPressed: bloc.events.login,
        text: context.l10n.featureLogin.logIn,
      );
}
