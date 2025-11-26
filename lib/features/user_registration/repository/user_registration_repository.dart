import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';

/// 유저 등록 관련 데이터 처리
/// 나중에 API 연동 시 Repository에서 비즈니스 로직을 추가
class UserRegistrationRepository {
  final UserRegistrationDataSource dataSource;

  UserRegistrationRepository(this.dataSource);

  /// 유저 등록 완료 (API 연동 시 사용)
  Future<void> completeUserRegistration(UserRegistrationData data) async {
    // TODO: API 연동 시 구현
    // API 연동 시 여기서 추가 검증/변환 가능
    return dataSource.completeUserRegistration(data);
  }
}
