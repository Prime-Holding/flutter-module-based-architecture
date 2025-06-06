// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:equatable/equatable.dart';
import 'package:widget_toolkit/models.dart';

class DataModel extends PickerItemModel with EquatableMixin {
  DataModel({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  String get itemDisplayName => name;

  @override
  String toString() => name;

  @override
  List<Object?> get props => [name, description];
}
