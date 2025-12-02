import '../models.dart';
import 'login_datasource.dart';
import 'login_repository.dart';

/// 로그인 관련 데이터 처리 구현체
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<User?> login(String userId, String password) async {
    return await dataSource.findUserByCredentials(userId, password);
  }
}

