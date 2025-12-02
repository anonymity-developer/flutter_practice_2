import 'dart:async';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';
import 'user_registration_repository.dart';
import 'package:rxdart/rxdart.dart';

/// 유저 등록 관련 데이터 처리 구현체
class UserRegistrationRepositoryImpl implements UserRegistrationRepository {
  final UserRegistrationDataSource dataSource;
  final _userUpdateSubject = BehaviorSubject<String?>.seeded(null);

  UserRegistrationRepositoryImpl(this.dataSource);

  @override
  Stream<String?> get userUpdates => _userUpdateSubject.stream;

  @override
  String? get lastUpdatedUserId => _userUpdateSubject.value;

  @override
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    try {
      await dataSource.registerUser(userId, data);
      _userUpdateSubject.add(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    try {
      return await dataSource.getUserByUserId(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserRegistration(
    String userId,
    UserRegistrationData data,
  ) async {
    try {
      await dataSource.updateUser(userId, data);
      _userUpdateSubject.add(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUserRegistration(String userId) async {
    try {
      await dataSource.deleteUser(userId);
      _userUpdateSubject.add(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void triggerUpdate(String userId) {
    _userUpdateSubject.add(userId);
  }

  @override
  void dispose() {
    _userUpdateSubject.close();
  }
}

