import '../models.dart';

/// 회원가입 데이터 저장소
/// 나중에 API 연동 시 HTTP 요청을 담당
class SignupDataSource {
  /// 회원가입 완료 (API 연동 시 사용)
  Future<void> completeSignup(SignupData data) async {
    // TODO: API 연동 시 구현
    // 예: await apiClient.post('/signup', data.toJson());
  }
}
