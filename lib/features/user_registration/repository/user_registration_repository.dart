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
  
  /// 유저 등록 완료
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    await dataSource.registerUser(userId, data);
    _userUpdateSubject.add(userId); // 변경 알림
  }
  
  /// 사용자 ID로 유저 등록 정보 조회
  Future<UserRegistrationData?> getUserDataByUserId(String userId) async {
    return dataSource.getUserDataByUserId(userId);
  }
  
  /// 리소스 정리
  void dispose() {
    // _userUpdateController.close();
    _userUpdateSubject.close();
  }
}