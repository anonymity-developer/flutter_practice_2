import '../models.dart';

abstract class LoginDataSource {
  /// 로그인
  Future<User?> findUserByCredentials(String userId, String password);
  
  /// 회원가입
  Future<User> register(String userId, String password, {String? phone});
}
