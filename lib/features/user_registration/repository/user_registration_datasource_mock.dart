import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';

// 테스트/개발용 Mock 구현체
class UserRegistrationDataSourceMock implements UserRegistrationDataSource {

  final Map<String, String> _userLoginIdToSystemIdMap = {
    'test1': '1',
    'test2': '2',
  };

  final Map<String, UserRegistrationData> _mockData = {
    '1': const UserRegistrationData(
      nickname: 'mock 유저1',
      birthday: '2025-01-01',
      gender: UserGender.male,
      referralCode: '1234567890',
      serviceTerms: true,
      privacyPolicy: true,
      locationInfo: false,
      marketingInfo: true,
    ),
    '2': const UserRegistrationData( 
      nickname: 'mock 유저2',
      birthday: '1990-02-02',
      gender: UserGender.female,
      referralCode: 'REF002',
      serviceTerms: true,
      privacyPolicy: true,
      locationInfo: true,
      marketingInfo: true,
    ),
  };

  String? _getUserSystemIdByLoginId(String userLoginId) {
    return _userLoginIdToSystemIdMap[userLoginId];
  }

  @override
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null) {
      throw Exception('유저 등록 실패: 사용자를 찾을 수 없습니다.');
    }
    _mockData[userSystemId] = data;
  }

  @override
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null) {
      return null;
    }
    return _mockData[userSystemId];
  }

  @override
  Future<void> updateUser(String userId, UserRegistrationData data) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null || !_mockData.containsKey(userSystemId)) {
      throw Exception('유저 등록 정보 수정 실패: 등록 정보를 찾을 수 없습니다.');
    }
    _mockData[userSystemId] = data;
  }

  @override
  Future<void> deleteUser(String userId) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null || !_mockData.containsKey(userSystemId)) {
      throw Exception('유저 등록 정보 삭제 실패: 등록 정보를 찾을 수 없습니다.');
    }
    _mockData.remove(userSystemId);
  }
}