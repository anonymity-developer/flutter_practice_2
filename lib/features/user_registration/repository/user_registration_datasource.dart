import 'package:flutter_application_2/features/user_registration/models.dart';

abstract class UserRegistrationDataSource {
  Future<void> registerUser(String userId, UserRegistrationData data);
  Future<UserRegistrationData?> getUserByUserId(String userId);
  Future<void> updateUser(String userId, UserRegistrationData data);
  Future<void> deleteUser(String userId);
}
