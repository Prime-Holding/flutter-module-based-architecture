// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    this.error,
    super.key,
  });

  final Exception? error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appBarText),
        ),
        body: Center(
          child: error == null
              ? Text(context.l10n.errorOccurred)
              : Text(context.l10n.error(error.toString())),
        ),
      );
}
