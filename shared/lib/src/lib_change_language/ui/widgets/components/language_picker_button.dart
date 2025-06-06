// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:design_system/design_system.dart';

import '../../bloc/change_language_bloc.dart';
import '../../../domain/extensions/language_model_extensions.dart';
import '../../../domain/services/app_language_service.dart';

class LanguagePickerButton extends StatelessWidget {
  const LanguagePickerButton({
    this.service,
    this.translate,
    this.padding,
    this.buttonText,
    super.key,
  });

  final LanguageService? service;
  final String Function(LanguageModel)? translate;
  final double? padding;
  final String? buttonText;
  static const String _buttonText = 'Change Language';

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding ?? context.designSystem.spacing.xl0,
        ),
        child: OutlineFillButton(
          text: buttonText ?? _buttonText,
          onPressed: () => showChangeLanguageBottomSheet(
            context: context,
            service: service ?? context.read<AppLanguageService>(),
            onChanged: (language) => context
                .read<ChangeLanguageBlocType>()
                .events
                .setCurrentLanguage(language),
            translate: translate ?? (model) => model.asText(context),
          ),
        ),
      );
}
