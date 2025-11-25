import '../models.dart';
import 'login_datasource.dart';

/// 로그인 관련 데이터 처리
class LoginRepository {
  final LoginDataSource dataSource;

  LoginRepository(this.dataSource);

  /// 로그인 (목데이터 체크)
  Future<User?> login(String userId, String password) async {
    return await dataSource.findUserByCredentials(userId, password);
  }
}
