// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart' hide ErrorModel;

import '../../../design_system.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.errorText,
    required this.onTabRetry,
    required this.onTabRetryText,
    super.key,
  });

  final String errorText;
  final String onTabRetryText;
  final Function() onTabRetry;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.designSystem.spacing.l),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: OutlineFillButton(
              onPressed: onTabRetry,
              text: onTabRetryText,
            ),
          ),
        ],
      );
}
