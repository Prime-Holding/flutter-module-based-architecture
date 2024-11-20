// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_code_update_request.g.dart';

@JsonSerializable()
@CopyWith()
class PinCodeUpdateRequest with EquatableMixin {
  PinCodeUpdateRequest({
    required this.pinCode,
    required this.token,
  });

  // The new PIN code
  final String pinCode;
  // The token returned by the verification request
  final String token;

  factory PinCodeUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PinCodeUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinCodeUpdateRequestToJson(this);

  @override
  List<Object?> get props => [pinCode, token];

  @override
  bool? get stringify => true;
}
