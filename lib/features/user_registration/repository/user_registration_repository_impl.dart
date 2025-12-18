import 'dart:async';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';
import 'user_registration_repository.dart';
import 'package:rxdart/rxdart.dart';

/// 유저 등록 관련 데이터 처리 구현체
/// 로컬(Hive)과 서버(API/Mock) 두 DataSource를 조합하여 사용
class UserRegistrationRepositoryImpl implements UserRegistrationRepository {
  final UserRegistrationDataSource apiDataSource;
  final UserRegistrationDataSource hiveDataSource;
  final _userUpdateSubject = BehaviorSubject<String?>.seeded(null);

  UserRegistrationRepositoryImpl({
    required this.apiDataSource,
    required this.hiveDataSource,
  });

  @override
  Stream<String?> get userUpdates => _userUpdateSubject.stream;

  @override
  String? get lastUpdatedUserId => _userUpdateSubject.value;

  @override
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.registerUser(userId, data);
      _userUpdateSubject.add(userId);
      await apiDataSource.registerUser(userId, data);
    } catch (e) {
      await hiveDataSource.deleteUser(userId);
      _userUpdateSubject.add(userId);
      rethrow;
    }
  }

  @override
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    try {
      // 로컬 데이터 조회 -> 서버 동기화 (백그라운드) -> 로컬 데이터 반환
      final localData = await hiveDataSource.getUserByUserId(userId);
      _syncFromServer(userId);
      return localData;
    } catch (e) {
      rethrow;
    }
  }

  /// 서버에서 데이터를 가져와 로컬에 저장하고 스트림으로 알림
  Future<void> _syncFromServer(String userId) async {
    try {
      final serverData = await apiDataSource.getUserByUserId(userId);
      if (serverData != null) {
        await hiveDataSource.registerUser(userId, serverData);
        _userUpdateSubject.add(userId);
      }
    } catch (e) {
      // 서버 동기화 실패해도 로컬 데이터는 유지, 에러는 무시(오프라인 모드 지원)
    }
  }

  @override
  Future<void> updateUserRegistration(
    String userId,
    UserRegistrationData data,
  ) async {
    // 롤백용 기존 데이터 백업
    final previousData = await hiveDataSource.getUserByUserId(userId);
    
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.updateUser(userId, data);
      _userUpdateSubject.add(userId);
      await apiDataSource.updateUser(userId, data);
    } catch (e) {
      if (previousData != null) {
        await hiveDataSource.updateUser(userId, previousData);
      } else {
        await hiveDataSource.deleteUser(userId);
      }
      _userUpdateSubject.add(userId);
      rethrow;
    }
  }

  @override
  Future<void> deleteUserRegistration(String userId) async {
    // 롤백용 기존 데이터 백업
    final previousData = await hiveDataSource.getUserByUserId(userId);
    
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.deleteUser(userId);
      _userUpdateSubject.add(userId);
      await apiDataSource.deleteUser(userId);
    } catch (e) {
      if (previousData != null) {
        await hiveDataSource.registerUser(userId, previousData);
        _userUpdateSubject.add(userId);
      }
      rethrow;
    }
  }

  @override
  void triggerUpdate(String userId) {
    _userUpdateSubject.add(userId);
  }

  @override
  void dispose() {
    _userUpdateSubject.close();
  }
}

