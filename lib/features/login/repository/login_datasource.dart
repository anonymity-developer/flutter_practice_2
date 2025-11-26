import '../models.dart';

/// 로그인 데이터 저장소 (목데이터)
class LoginDataSource {
  // 목데이터 사용자 목록
  static final List<Map<String, dynamic>> _mockUsers = [
    {
      'userId': 'test1',
      'password': '1234',
      'id': '1',
      'name': '테스트1',
      'phone': '010-0000-0001',
      'isRegistered': false, // 앱 등록 안 함
    },
    {
      'userId': 'test2',
      'password': '1234',
      'id': '2',
      'name': '테스트2',
      'phone': '010-0000-0002',
      'isRegistered': true, // 앱 등록 함
    },
  ];

  /// 목데이터에서 사용자 찾기
  Future<User?> findUserByCredentials(String userId, String password) async {
    for (final userMap in _mockUsers) {
      if (userMap['userId'] == userId && userMap['password'] == password) {
        return User(
          id: userMap['id'] as String,
          name: userMap['name'] as String,
          phone: userMap['phone'] as String?,
          isRegistered: userMap['isRegistered'] as bool,
        );
      }
    }
    return null;
  }
}
