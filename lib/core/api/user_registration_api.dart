import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';

part 'user_registration_api.g.dart';

@RestApi()
abstract class UserRegistrationApi {
  factory UserRegistrationApi(Dio dio, {String? baseUrl}) = _UserRegistrationApi;

  @GET('/users/{userId}/registration')
  Future<UserRegistrationData?> getUserByUserId(
    @Path('userId') String userId,
  );

  @POST('/users/{userId}/registration')
  Future<void> registerUser(
    @Path('userId') String userId,
    @Body() UserRegistrationData data,
  );

  @PUT('/users/{userId}/registration')
  Future<void> updateUser(
    @Path('userId') String userId,
    @Body() UserRegistrationData data,
  );

  @DELETE('/users/{userId}/registration')
  Future<void> deleteUser(
    @Path('userId') String userId,
  );
}

// userId = userLoginId