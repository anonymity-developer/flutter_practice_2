import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_application_2/features/login/models.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio, {String? baseUrl}) = _LoginApi;

  @POST('/auth/login')
  Future<User> login(
    @Body() Map<String, dynamic> credentials,
  );

  @POST("/auth/register")
  Future<User> register(
    @Body() Map<String, dynamic> credentials,
  );
}