import 'package:flutter_application_2/features/user_registration/models.dart';

/// 유저 등록 관련 데이터 처리 인터페이스
abstract class UserRegistrationRepository {
  /// 유저 정보 업데이트 스트림 (userId를 emit)
  Stream<String?> get userUpdates;

  /// BehaviorSubject의 현재 값 (마지막으로 emit된 userId) - 구독 시작 전에 마지막 값을 확인
  String? get lastUpdatedUserId;

  /// 유저 등록 완료
  Future<void> registerUser(String userId, UserRegistrationData data);

  /// 사용자 ID로 유저 등록 정보 조회
  Future<UserRegistrationData?> getUserByUserId(String userId);

  /// 유저 등록 정보 수정
  Future<void> updateUserRegistration(String userId, UserRegistrationData data);

  /// 유저 등록 정보 삭제
  Future<void> deleteUserRegistration(String userId);

  /// 스트림 업데이트 트리거 - BehaviorSubject에 userId를 emit하여 스트림을 통해 데이터 로드
  void triggerUpdate(String userId);

  /// 리소스 정리
  void dispose();
}
