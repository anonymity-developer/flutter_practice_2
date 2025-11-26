import 'package:flutter_application_2/features/user_registration/models.dart';

/// 유저 등록 데이터 저장소
/// 나중에 API 연동 시 HTTP 요청을 담당
class UserRegistrationDataSource {
  /// 유저 등록 완료 (API 연동 시 사용)
  Future<void> completeUserRegistration(UserRegistrationData data) async {
    // TODO: API 연동 시 구현
    // 예: await apiClient.post('/user_registration', data.toJson());
  }

  /// 사용자 ID로 유저 등록 정보 조회 (목데이터)
  Future<UserRegistrationData?> getUserRegistrationByUserId(String userId) async {
    // 목데이터: test2(id: '2')의 유저 등록 정보
    if (userId == '2') {
      return const UserRegistrationData(
        nickname: '테스트2 닉네임',
        birthday: '1990-01-01',
        gender: '남성',
        referralCode: '테스트2 추천코드',
        serviceTerms: true,
        privacyPolicy: true,
        locationInfo: false,
        marketingInfo: false,
      );
    }
    return null;
  }
}
