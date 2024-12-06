// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/routes.dart';
import 'package:provider/provider.dart';

import '../ui_components/showcase_feature_list_tile.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = getFeatures(context);
    return Center(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: features.length,
        itemBuilder: (BuildContext context, index) {
          final feature = features[index];
          return ShowcaseFeatureListTile(
            featureTitle: feature.title,
            featureSubtitle: feature.subtitle,
            onTap: () {
              context.read<RouterBlocType>().events.push(feature.route);
            },
            icon: feature.icon,
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: context.designSystem.spacing.m,
          indent: context.designSystem.spacing.m,
          endIndent: context.designSystem.spacing.m,
        ),
      ),
    );
  }
}

List<({String title, String subtitle, AppRoute route, Icon icon})> getFeatures(
    BuildContext context) {
  return [
    (
      title: context.l10n.featureShowcase.counterShowcase,
      subtitle: context.l10n.featureShowcase.counterShowcaseDescription,
      route: CounterRoute(),
      icon: context.designSystem.icons.calculateIcon,
    ),
    (
      title: context.l10n.featureShowcase.widgetToolkitShowcase,
      subtitle: context.l10n.featureShowcase.widgetToolkitShowcaseDescription,
      route: WidgetToolkitRoute(),
      icon: context.designSystem.icons.widgetIcon,
    ),
    (
      title: context.l10n.featureShowcase.qrCodeShowcase,
      subtitle: context.l10n.featureShowcase.qrCodeShowcaseDescription,
      route: QrCodeRoute(),
      icon: context.designSystem.icons.qrCode,
    ),
    (
      title: context.l10n.featureShowcase.deepLinkShowcase,
      subtitle: context.l10n.featureShowcase.deepLinkShowcaseDescription,
      route: DeepLinksRoute(),
      icon: context.designSystem.icons.linkIcon,
    ),
    (
      title: context.l10n.featureShowcase.mfaShowcase,
      subtitle: context.l10n.featureShowcase.mfaShowcaseDescription,
      route: FeatureMfaRoute(),
      icon: context.designSystem.icons.pin,
    ),
    (
      title: context.l10n.featureShowcase.otpShowcase,
      subtitle: context.l10n.featureShowcase.otpShowcaseDescription,
      route: FeatureOtpRoute(),
      icon: context.designSystem.icons.otp,
    ),
  ];
}
