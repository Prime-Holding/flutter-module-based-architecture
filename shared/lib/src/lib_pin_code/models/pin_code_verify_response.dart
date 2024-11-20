// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_code_verify_response.g.dart';

@JsonSerializable()
@CopyWith()
class PinCodeVerifyResponse with EquatableMixin {
  PinCodeVerifyResponse({
    this.token,
  });

  // The token used to update the PIN afterwards
  final String? token;

  factory PinCodeVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$PinCodeVerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PinCodeVerifyResponseToJson(this);

  @override
  List<Object?> get props => [token];

  @override
  bool? get stringify => true;
}
