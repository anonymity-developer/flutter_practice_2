import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api/user_registration_api.dart';
import 'package:flutter_application_2/core/config/api_config.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'user_registration_datasource.dart';


/// 유저 등록 데이터 저장소
/// Retrofit을 통한 API 호출
class UserRegistrationDataSourceApi implements UserRegistrationDataSource {
  final UserRegistrationApi _api;

  UserRegistrationDataSourceApi()
      : _api = UserRegistrationApi(
          Dio(BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          )),
        );

  /// 유저 등록 완료
  @override
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    try {
      await _api.registerUser(userId, data);
    } on DioException catch (e) {
      throw Exception('유저 등록 실패: ${e.message}');
    } catch (e) {
      throw Exception('유저 등록 실패: $e');
    }
  }

  /// 사용자 ID로 유저 등록 정보 조회
  @override
  Future<UserRegistrationData?> getUserByUserId(String userId) async {
    try {
      final data = await _api.getUserByUserId(userId);
      return data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw Exception('유저 정보 조회 실패: ${e.message}');
    } catch (e) {
      throw Exception('유저 정보 조회 실패: $e');
    }
  }

  /// 유저 등록 정보 수정
  @override
  Future<void> updateUser(String userId, UserRegistrationData data) async {
    try {
      await _api.updateUser(userId, data);
    } on DioException catch (e) {
      throw Exception('유저 등록 정보 수정 실패: ${e.message}');
    } catch (e) {
      throw Exception('유저 등록 정보 수정 실패: $e');
    }
  }

  /// 유저 등록 정보 삭제
  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _api.deleteUser(userId);
    } on DioException catch (e) {
      throw Exception('유저 등록 정보 삭제 실패: ${e.message}');
    } catch (e) {
      throw Exception('유저 등록 정보 삭제 실패: $e');
    }
  }
}

/// override로 해당 메서드가 인터페이스의 메서드를 구현한다는 것을 명시 
/// 인터페이스에는 시그니처(함수 원형)만 두고, 구현체는 각자 다른 파일, 다른 로직을 사용하는 것이 일반적 -> 유연성, 단일책임, 확장성을 위함
/// 공통 로직이 필요한 경우에는 별도 유틸리티나 믹스인을 사용