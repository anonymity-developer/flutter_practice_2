import '../models.dart';
import 'signup_datasource.dart';

/// 회원가입 관련 데이터 처리
/// 나중에 API 연동 시 Repository에서 비즈니스 로직을 추가
class SignupRepository {
  final SignupDataSource dataSource;

  SignupRepository(this.dataSource);

  /// 회원가입 완료 (API 연동 시 사용)
  Future<void> completeSignup(SignupData data) async {
    // TODO: API 연동 시 구현 API 연동 시 여기서 추가 검증/변환 가능
    return dataSource.completeSignup(data);
  }
}
