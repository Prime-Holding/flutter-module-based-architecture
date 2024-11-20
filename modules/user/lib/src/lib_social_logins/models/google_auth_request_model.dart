// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:json_annotation/json_annotation.dart';

import 'google_credentials_model.dart';

part 'google_auth_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GoogleAuthRequestModel {
  final String? displayName;
  final String email;
  final String id;
  final String? photoUrl;
  final String? serverAuthCode;

  GoogleAuthRequestModel({
    this.displayName,
    required this.email,
    required this.id,
    this.photoUrl,
    this.serverAuthCode,
  });
  factory GoogleAuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleAuthRequestModelToJson(this);

  factory GoogleAuthRequestModel.fromGoogleCredentials(
          GoogleCredentialsModel credentials) =>
      GoogleAuthRequestModel(
        displayName: credentials.displayName,
        email: credentials.email,
        id: credentials.id,
        photoUrl: credentials.photoUrl,
        serverAuthCode: credentials.serverAuthCode,
      );
}
