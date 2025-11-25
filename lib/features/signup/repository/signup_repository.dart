import 'signup_datasource.dart';
import '../models.dart';

/// 회원가입 관련 데이터 처리
/// 나중에 API 연동 시 여기서 회원가입 API 호출
class SignupRepository {
  final SignupDataSource dataSource;

  SignupRepository(this.dataSource);

  /// 회원가입 완료 (API 연동 시 사용)
  Future<void> completeSignup(SignupData data) async {
    // TODO: API 연동 시 구현
    // 예: return await apiClient.post('/signup', data.toJson());
  }
}
