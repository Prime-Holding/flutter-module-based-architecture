// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../lib_auth/domain/models/auth_token_model.dart';
import '../../domain/models/facebook_auth_request_model.dart';

part 'facebook_auth_data_source.g.dart';

@RestApi()
abstract class FacebookAuthDataSource {
  factory FacebookAuthDataSource(Dio dio, {String baseUrl}) =
      _FacebookAuthDataSource;

  @POST('/api/authenticate/facebook')
  Future<AuthTokenModel> facebookAuthenticate(
      @Body() FacebookAuthRequestModel authData);
}
