import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';

part 'pet_registration_api.g.dart';

@RestApi()
abstract class PetRegistrationApi {
  factory PetRegistrationApi(Dio dio, {String? baseUrl}) = _PetRegistrationApi;

  @GET('/pets/breeds/{type}')
  Future<List<String>> getBreeds(
    @Path('type') String type,
  );

  @GET('/users/{userId}/pets')
  Future<List<Pet>> getPetsByUserId(
    @Path('userId') String userId,
  );

  @POST('/users/{userId}/pets')
  Future<Pet> registerPet(
    @Path('userId') String userId,
    @Body() Pet pet,
  );

  @PUT('/users/{userId}/pets/{petId}') 
  Future<Pet> updatePet(
    @Path('userId') String userId,
    @Path('petId') String petId,
    @Body() Pet pet,
  );

  @DELETE('/users/{userId}/pets/{petId}') 
  Future<void> deletePet(
    @Path('userId') String userId,
    @Path('petId') String petId,
  );
}

// userId = userLoginId