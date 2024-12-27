// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../domain/services/qr_service.dart';
import '../widgets/qr_scanner_page.dart';

class QrScannerPageWithDependencies extends StatelessWidget {
  const QrScannerPageWithDependencies({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._services,
        ],
        child: const QrScannerPage(),
      );

  List<Provider> get _services => [
        Provider<QrService>(
          create: (context) => QrService(),
        ),
      ];
}
