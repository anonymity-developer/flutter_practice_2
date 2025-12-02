import '../models.dart';

/// 로그인 관련 데이터 처리 인터페이스
abstract class LoginRepository {
  /// 로그인
  Future<User?> login(String userId, String password);

  /// 회원가입 method는 비워둠
}
