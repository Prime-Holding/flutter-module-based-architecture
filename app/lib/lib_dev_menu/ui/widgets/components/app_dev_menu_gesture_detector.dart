// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:alice/alice.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';

import '../../blocs/dev_menu_bloc.dart';

class AppDevMenuGestureDetector extends StatefulWidget {
  const AppDevMenuGestureDetector({
    required this.child,
    required this.onDevMenuPresented,
    required this.navigatorKey,
    super.key,
  });

  final Widget child;
  final VoidCallback onDevMenuPresented;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<AppDevMenuGestureDetector> createState() =>
      _AppDevMenuGestureDetectorState();
}

class _AppDevMenuGestureDetectorState extends State<AppDevMenuGestureDetector> {
  final _compositeSubscription = CompositeSubscription();

  @override
  void initState() {
    context
        .read<DevMenuBlocType>()
        .states
        .onDevMenuPresented
        .listen((_) => widget.onDevMenuPresented())
        .addTo(_compositeSubscription);

    WidgetsBinding.instance.addPostFrameCallback((_) => _setupAlice());

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.read<DevMenuBlocType>().events.tap(),
        child: widget.child,
      );

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }

  void _setupAlice() {
    Alice alice = context.read<Alice>();

    final navKey = widget.navigatorKey;
    if (navKey != null) {
      //Set navigator key if not null
      alice.setNavigatorKey(navKey);
    }
    final adapter = AliceDioAdapter();
    alice.addAdapter(adapter);

    // Attach interceptor to ApiHttpClient
    context.read<ApiHttpClient>().interceptors.add(adapter);

    // Attach interceptor to PlainHttpClient
    context.read<PlainHttpClient>().interceptors.add(adapter);
  }
}
