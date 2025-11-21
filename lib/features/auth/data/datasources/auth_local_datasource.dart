import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

/// Data Source: 실제 데이터 저장/조회를 담당하는 구체적인 구현
/// - SharedPreferences, Hive, SQLite, API 호출 등
/// - Repository가 이 DataSource를 사용하여 데이터를 가져옴
abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getSavedUser();
  Future<void> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'saved_user';

  @override
  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  @override
  Future<UserModel?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson == null) return null;
    final userMap = jsonDecode(userJson) as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
  }

  @override
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

