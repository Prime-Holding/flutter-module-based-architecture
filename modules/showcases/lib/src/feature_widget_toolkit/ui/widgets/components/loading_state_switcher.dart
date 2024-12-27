// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of '../common_components_page.dart';

class LoadingStateSwitcher extends StatefulWidget {
  const LoadingStateSwitcher({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isDataLoading, void Function(bool value)) builder;

  @override
  State<LoadingStateSwitcher> createState() => _LoadingStateSwitcherState();
}

class _LoadingStateSwitcherState extends State<LoadingStateSwitcher> {
  late bool isLoading;

  @override
  void initState() {
    _slapAfterThreeSeconds(true);
    super.initState();
  }

  Future<void> _slapAfterThreeSeconds(bool initial) async {
    if (mounted) {
      setState(() {
        isLoading = initial;
      });
    }
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        isLoading = !initial;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder.call(isLoading, _slapAfterThreeSeconds);
}
