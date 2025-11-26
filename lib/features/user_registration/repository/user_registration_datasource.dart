import 'package:flutter_application_2/features/user_registration/models.dart';

/// 유저 등록 데이터 저장소
/// 나중에 API 연동 시 HTTP 요청을 담당
class UserRegistrationDataSource {
  /// 유저 등록 완료 (API 연동 시 사용)
  Future<void> completeUserRegistration(UserRegistrationData data) async {
    // TODO: API 연동 시 구현
    // 예: await apiClient.post('/user_registration', data.toJson());
  }
}
