import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';

/// Hive 사용 유저 등록 데이터 저장소
class UserRegistrationDataSourceHive implements UserRegistrationDataSource {
  static const String _boxName = 'user_registration';
  Box<UserRegistrationData>? _box;

  Future<void> _ensureBox() async {
    _box ??= await Hive.openBox<UserRegistrationData>(_boxName);
  }

  @override
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    await _ensureBox();
    await _box!.put(userId, data);
  }

  @override
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    await _ensureBox();
    return _box!.get(userId);
  }

  @override
  Future<void> updateUser(String userId, UserRegistrationData data) async {
    await _ensureBox();
    await _box!.put(userId, data);
  }

  @override
  Future<void> deleteUser(String userId) async {
    await _ensureBox();
    await _box!.delete(userId);
  }
}

