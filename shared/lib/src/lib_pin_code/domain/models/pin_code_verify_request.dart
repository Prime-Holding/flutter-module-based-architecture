// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pin_code_verify_request.g.dart';

@JsonSerializable()
@CopyWith()
class PinCodeVerifyRequest with EquatableMixin {
  PinCodeVerifyRequest({
    required this.pinCode,
    this.requestUpdateToken = false,
  });

  // The PIN code to verify
  final String pinCode;
  // Whether to request a token, used to update the PIN afterwards
  final bool requestUpdateToken;

  factory PinCodeVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$PinCodeVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinCodeVerifyRequestToJson(this);

  @override
  List<Object?> get props => [pinCode, requestUpdateToken];

  @override
  bool? get stringify => true;
}
