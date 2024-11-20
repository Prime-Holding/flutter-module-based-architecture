// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:google_sign_in/google_sign_in.dart';

import '../models/cancelled_error_model.dart';

class GoogleCredentialDataSource {
  Future<GoogleSignInAccount> getUsersGoogleCredential() async {
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw CancelledErrorModel();
    }
    return googleUser;
  }
}
