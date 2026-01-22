// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../domain/services/custom_edit_address_service.dart';
import '../../domain/services/local_address_field_service.dart';

import '../utils/edit_address_custom_localisations.dart';
import 'components/widget_section.dart';

class EditFieldsPage extends StatelessWidget {
  const EditFieldsPage({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        WidgetSection(
          description: context.l10n.textFieldDialog,
          child: TextFieldDialog<String>(
            translateError: (error) =>
                ErrorModelFieldL10n.translateError<String>(error, context),
            label: context.l10n.textFieldLabel,
            value: context.l10n.nameValue,
            validator: LocalAddressFieldService(),
            header: context.l10n.headerValue,
            fillButtonText: context.l10n.textFieldButtonText,
          ),
        ),
        WidgetSection(
          description: context.l10n.editAddress,
          child: EditAddressWidget<CountryModel>(
            translateError: (error) =>
                ErrorModelFieldL10n.translateError<String>(error, context),
            service: context.read<CustomEditAddressService<CountryModel>>(),
            onSaved: (address) => showBlurredBottomSheet(
              context: context,
              builder: (context) => MessagePanelWidget(
                message: address.fullAddress,
                messageState: MessagePanelState.informative,
              ),
            ),
            localizedStrings: context.read<EditAddressCustomLocalisations>(),
          ),
        ),
      ],
    ),
  );
}
