// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ShowcaseFeatureListTile extends StatelessWidget {
  const ShowcaseFeatureListTile({
    super.key,
    required this.onTap,
    required this.featureTitle,
    required this.featureSubtitle,
    required this.icon,
  });

  final void Function() onTap;
  final String featureTitle;
  final String featureSubtitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.designSystem.spacing.m,
        vertical: context.designSystem.spacing.xxxs,
      ),
      child: ListTile(
        title: Text(featureTitle),
        subtitle: Text(featureSubtitle),
        onTap: onTap,
        leading: icon,
      ),
    );
  }
}
