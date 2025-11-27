import 'package:flutter_application_2/features/user_registration/models.dart';

/// 유저 등록 데이터 저장소
/// 나중에 API 연동 시 HTTP 요청을 담당
class UserRegistrationDataSource {
  // 인메모리 저장소 (등록 완료한 유저 정보)
  final Map<String, UserRegistrationData> _registeredUsers = {
    // test2 초기 데이터 (기존 목데이터 유지)
    '2': const UserRegistrationData(
      nickname: '테스트2 닉네임',
      birthday: '1990-01-01',
      gender: '남성',
      referralCode: '테스트2 추천코드',
      serviceTerms: true,
      privacyPolicy: true,
      locationInfo: false,
      marketingInfo: false,
    ),
  };

  /// 유저 등록 완료 (인메모리 저장)
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    // 인메모리에 저장
    _registeredUsers[userId] = data;
    
    // 나중에 API 연동 시
    // await apiClient.post('/user_registration', {
    //   'userId': userId,
    //   ...data.toJson(),
    // });
  }

  /// 사용자 ID로 유저 등록 정보 조회
  Future<UserRegistrationData?> getUserDataByUserId(String userId) async {
    // 인메모리에서 조회
    return _registeredUsers[userId];
  }
}
