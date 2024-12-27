// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

class CredentialsModel {
  CredentialsModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  bool equals(CredentialsModel credentials) =>
      email == credentials.email && password == credentials.password;
}
