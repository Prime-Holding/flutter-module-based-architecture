// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:json_annotation/json_annotation.dart';

part 'count.g.dart';

@JsonSerializable()
class Count {
  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);
  Count(this.value);

  final int value;
  Map<String, dynamic> toJson() => _$CountToJson(this);
}
