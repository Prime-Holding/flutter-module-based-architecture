// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config.dart';
import '../utils/utilities.dart';

class AuthToken {
  AuthToken._(
    this.token,
    this.refreshToken,
  );

  /// Generates a new auth token that's valid for one hour
  factory AuthToken.generateNew() {
    final claimSet = JwtClaim(
      issuer: jwtIssuer,
      audience: jwtAudiences,
      payload: {
        'userId': generateRandomString(),
      },
      maxAge: const Duration(hours: 1),
    );

    final authToken = issueJwtHS256(claimSet, jwtSigningKey);
    final refreshToken = generateRandomString();

    return AuthToken._(
      authToken,
      refreshToken,
    );
  }

  /// The value of the access token
  final String token;

  /// The value of the refresh token
  final String refreshToken;

  bool get isValid {
    try {
      // Decode the token and verify the signature
      final decodedClaimSet = verifyJwtHS256Signature(token, jwtSigningKey);

      // Validate the issuer, audience and expiration
      decodedClaimSet.validate(
        issuer: jwtIssuer,
        audience: jwtAudiences.first,
      );
    } on JwtException {
      return false;
    }

    return true;
  }

  Map<String, Object?> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
      };
}
