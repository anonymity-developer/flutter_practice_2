import '../entities/user.dart';

/// Domain Repository Interface: 비즈니스 로직에서 사용할 데이터 접근 계약
/// - 구현체는 Data 레이어에 있음 (의존성 역전 원칙)
/// - UseCase나 BLoC에서 이 인터페이스를 통해 데이터에 접근
abstract class AuthRepository {
  /// 회원가입
  Future<User> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
  });
  
  /// 저장된 사용자 정보 가져오기
  Future<User?> getSavedUser();
  
  /// 사용자 정보 삭제
  Future<void> clearUser();
}

