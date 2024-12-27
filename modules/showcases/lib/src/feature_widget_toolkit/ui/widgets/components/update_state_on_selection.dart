// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class UpdateStateOnSelection<T> extends StatefulWidget {
  const UpdateStateOnSelection({
    required this.builder,
    this.getString,
    super.key,
  });

  final Widget Function(
      List<T> data, void Function(List<T> newData) updateState) builder;
  final String Function(T element)? getString;

  @override
  State<UpdateStateOnSelection<T>> createState() =>
      _UpdateStateOnSelectionState<T>();
}

class _UpdateStateOnSelectionState<T> extends State<UpdateStateOnSelection<T>> {
  late List<T> localData;

  @override
  void initState() {
    localData = <T>[];
    super.initState();
  }

  void updateState(List<T> newData) {
    setState(() {
      localData = newData;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          widget.builder
              .call(localData, (List<T> newData) => updateState(newData)),
          if (localData.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Text(
                  (localData.length >= 2)
                      ? context.l10n.featureWidgetToolkit.selectedItems
                      : context.l10n.featureWidgetToolkit.selectedItem,
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...localData.map(
                        (e) => Text(
                          '${widget.getString?.call(e) ?? e.toString()} ',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ],
      );
}
