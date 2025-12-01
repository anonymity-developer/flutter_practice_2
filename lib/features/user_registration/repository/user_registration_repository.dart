import 'dart:async';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';
import 'package:rxdart/rxdart.dart';

class UserRegistrationRepository {
  final UserRegistrationDataSource dataSource;
  final _userUpdateSubject = BehaviorSubject<String?>.seeded(null); // 마지막값 캐싱

  UserRegistrationRepository(this.dataSource);

  /// 유저 정보 업데이트 스트림 (userId를 emit)
  Stream<String?> get userUpdates => _userUpdateSubject.stream;

  /// BehaviorSubject의 현재 값 (마지막으로 emit된 userId) - 구독 시작 전에 마지막 값을 확인
  String? get lastUpdatedUserId => _userUpdateSubject.value;

  /// 유저 등록 완료
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    await dataSource.registerUser(userId, data);
    _userUpdateSubject.add(userId); // 변경 알림
  }

  /// 사용자 ID로 유저 등록 정보 조회
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    return dataSource.getUserByUserId(userId);
  }

  /// 유저 등록 정보 수정
  Future<void> updateUserRegistration(
    String userId,
    UserRegistrationData data,
  ) async {
    await dataSource.updateUser(userId, data);
    _userUpdateSubject.add(userId); // 변경 알림
  }

  /// 유저 등록 정보 삭제
  Future<void> deleteUserRegistration(String userId) async {
    await dataSource.deleteUser(userId);
    _userUpdateSubject.add(userId); // 변경 알림
  }

  /// 스트림 업데이트 트리거 - BehaviorSubject에 userId를 emit하여 스트림을 통해 데이터 로드
  void triggerUpdate(String userId) {
    _userUpdateSubject.add(userId);
  }

  /// 리소스 정리
  void dispose() {
    _userUpdateSubject.close();
  }
}
