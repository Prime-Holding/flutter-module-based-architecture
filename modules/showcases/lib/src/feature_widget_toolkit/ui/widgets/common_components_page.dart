// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import 'components/widget_section.dart';
import '../utils/utils.dart';

part 'components/loading_state_switcher.dart';

class CommonComponentsPage extends StatelessWidget {
  const CommonComponentsPage({required this.pageController, super.key});

  final PageController pageController;
  static const String _imageUrl =
      'https://www.btsbg.org/sites/default/files/obekti/stobski-piramidi-selo-stob.jpg';

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        WidgetSection(
          description: context.l10n.openUrlWidgetLaunchURLLink,
          child: OpenUrlWidgetWithDependencies(
            url: context.l10n.primeHoldingUrl,
            translateError: translateError,
            child: Text(
              context.l10n.primeHoldingUrl,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        WidgetSection(
          description: context.l10n.openUrlWidgetCallAPhoneNumber,
          child: OpenUrlWidgetWithDependencies(
            url: context.l10n.phoneNumber,
            uriType: UriType.telephone,
            translateError: translateError,
            child: Text(
              context.l10n.phoneNumber,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        LoadingStateSwitcher(
          builder: (isLoading, simulateLoading) => WidgetSection(
            description: context.l10n.shimmerWrapper,
            childSize: const Size(180, 120),
            onRefresh: () => simulateLoading.call(true),
            child: ShimmerWrapper(
              showShimmer: isLoading,
              fadeTransition: true,
              alignment: Alignment.center,
              child: Image.network(_imageUrl),
            ),
          ),
        ),
        LoadingStateSwitcher(
          builder: (isLoading, simulateLoading) => WidgetSection(
            description: context.l10n.textShimmer,
            childSize: const Size(320, 32),
            onRefresh: () => simulateLoading.call(true),
            child: ShimmerText(
              isLoading ? null : context.l10n.displaysTextAfterLoaded,
              alignment: Alignment.center,
              type: ShimmerType.random(),
            ),
          ),
        ),
        WidgetSection(
          description: context.l10n.modalSheetWithMessage,
          child: OutlineFillButton(
            text: context.l10n.openModalSheet,
            onPressed: () => showBlurredBottomSheet(
              context: context,
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: MessagePanelWidget(
                  message: context.l10n.thisIsAnInformativeMessage,
                  messageState: MessagePanelState.informative,
                ),
              ),
            ),
          ),
        ),
        WidgetSection(
          description: context.l10n.errorModalSheet,
          child: GradientFillButton(
            text: context.l10n.presentErrorInModal,
            onPressed: () => showErrorBlurredBottomSheet(
              error: context.l10n.thisIsAnErrorMessage,
              context: context,
              retryCallback: (context) =>
                  Future.delayed(const Duration(seconds: 2)),
              retryButtonText: context.l10n.retry,
            ),
          ),
        ),
        WidgetSection(
          description: context.l10n.buttons,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: OutlineFillButton(
                  text: context.l10n.outlineFillButton,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: GradientFillButton(
                  text: context.l10n.gradientFillButton,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: GradientFillButton(
                  text: context.l10n.gradientFillButtonDisabled,
                  state: ButtonStateModel.disabled,
                  onPressed: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: IconTextButton(
                  text: context.l10n.iconTextButton,
                  icon: Icons.send_time_extension_outlined,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: SmallButton(
                  onPressed: () {},
                  icon: Icons.home_work_outlined,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
