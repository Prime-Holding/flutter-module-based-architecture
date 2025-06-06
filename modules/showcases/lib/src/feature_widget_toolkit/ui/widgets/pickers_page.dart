// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/item_picker.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/search_picker.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../data/repositories/search_repository.dart';
import '../../domain/models/data_model.dart';
import '../../domain/services/data_service.dart';
import '../../domain/services/search_service.dart';
import 'components/update_state_on_selection.dart';
import 'components/widget_section.dart';

class PickersPage extends StatelessWidget {
  const PickersPage({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            WidgetSection(
              description:
                  context.l10n.featureWidgetToolkit.itemPickerSingleSelect,
              child: UpdateStateOnSelection<DataModel>(
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: context.l10n.featureWidgetToolkit.selectOneItem,
                  onPressed: () => showItemPickerBottomSheet<DataModel>(
                    context: context,
                    title: context.l10n.featureWidgetToolkit.selectASingleItem,
                    selectedItems: updatedData,
                    callback: (data) => updateFunction.call(data),
                    service: DataService(),
                    configuration:
                        const ItemPickerConfiguration(isMultiSelect: false),
                  ),
                ),
              ),
            ),
            WidgetSection(
              description:
                  context.l10n.featureWidgetToolkit.itemPickerMultiSelect,
              child: UpdateStateOnSelection<DataModel>(
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: context.l10n.featureWidgetToolkit.selectAFewItems,
                  onPressed: () => showItemPickerBottomSheet<DataModel>(
                      context: context,
                      title: context.l10n.featureWidgetToolkit.selectAFewItems,
                      selectedItems: updatedData,
                      callback: (data) => updateFunction.call(data),
                      service: DataService(),
                      configuration:
                          const ItemPickerConfiguration(isMultiSelect: true)),
                ),
              ),
            ),
            WidgetSection(
              description: context.l10n.featureWidgetToolkit.searchPicker,
              child: UpdateStateOnSelection<CountryModel>(
                getString: (CountryModel element) => element.itemDisplayName,
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: context
                      .l10n.featureWidgetToolkit.selectAnItemFromLongList,
                  onPressed: () => showSearchPickerBottomSheet<CountryModel>(
                    context: context,
                    title: context.l10n.featureWidgetToolkit.selectCountry,
                    hintText: context.l10n.featureWidgetToolkit.typeSubstring,
                    retryText: context.l10n.featureWidgetToolkit.retry,
                    selectedItem:
                        updatedData.isNotEmpty ? updatedData[0] : null,
                    onItemTap: (item) =>
                        updateFunction.call(item != null ? [item] : []),
                    service: SearchService(SearchCountryRepository()),
                    emptyBuilder: () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MessagePanelWidget(
                        message:
                            context.l10n.featureWidgetToolkit.thereAreNoResults,
                        messageState: MessagePanelState.neutral,
                      ),
                    ),
                    modalConfiguration: const SearchPickerModalConfiguration(
                        safeAreaBottom: true),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
