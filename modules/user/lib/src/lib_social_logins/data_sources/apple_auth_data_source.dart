// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../lib_auth/models/auth_token_model.dart';
import '../models/apple_auth_request_model.dart';

part 'apple_auth_data_source.g.dart';

@RestApi()
abstract class AppleAuthDataSource {
  factory AppleAuthDataSource(Dio dio, {String baseUrl}) = _AppleAuthDataSource;

  @POST('/api/authenticate/apple')
  Future<AuthTokenModel> authenticate(@Body() AppleAuthRequestModel authData);
}
