import '../models.dart';
import 'login_datasource.dart';

/// 로그인 Mock 데이터소스
class LoginDataSourceMock implements LoginDataSource {
  final Map<String, User> _users = {
    'test1': const User(
      id: '1',
      userId: 'test1',
      password: '1234',
      phone: '010-0000-0001',
    ),
    'test2': const User(
      id: '2',
      userId: 'test2',
      password: '1234',
      phone: '010-0000-0002',
    ),
  };

  int _userIdCounter = 3;

  @override
  Future<User?> findUserByCredentials(String userId, String password) async {
    final user = _users[userId];
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }

  @override
  Future<User> register(String userId, String password, {String? phone}) async {
    if (_users.containsKey(userId)) {
      throw Exception('이미 존재하는 사용자입니다.');
    }
    
    final newId = _userIdCounter.toString();
    _userIdCounter++;
    
    final newUser = User(
      id: newId,
      userId: userId,
      password: password,
      phone: phone,
    );
    
    _users[userId] = newUser;
    
    return newUser;
  }
}
