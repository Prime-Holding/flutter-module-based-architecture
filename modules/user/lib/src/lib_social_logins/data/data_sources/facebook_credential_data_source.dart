// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../domain/models/cancelled_error_model.dart';
import '../../domain/models/facebook_auth_request_model.dart';

class FacebookCredentialDataSource {
  Future<FacebookAuthRequestModel> getUsersFacebookCredential() async {
    final result = await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
        'user_birthday',
        'user_gender',
        'user_link'
      ],
    );

    if (result.status == LoginStatus.cancelled) {
      throw CancelledErrorModel();
    }

    final userInfo = await FacebookAuth.instance.getUserData(
      fields: 'email,name,picture,birthday,gender,link',
    );

    return FacebookAuthRequestModel(
      email: userInfo['email'],
      facebookToken: result.accessToken!.tokenString,
      isAuthenticated: true,
      name: userInfo['name'],
      userPictureUrl: userInfo['picture']['data']['url'],
      userBirthday: userInfo['user_birthday'],
      userGender: userInfo['user_gender'],
      userLink: userInfo['user_link'],
      publicProfile: userInfo['public_profile'],
    );
  }
}
