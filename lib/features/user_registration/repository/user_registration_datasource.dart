import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api/user_registration_api.dart';
import 'package:flutter_application_2/core/config/api_config.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';

/// 유저 등록 데이터 저장소
/// Retrofit을 통한 API 호출
class UserRegistrationDataSource {
  final UserRegistrationApi _api;

  UserRegistrationDataSource()
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
  Future<void> registerUser(String userId, UserRegistrationData data) async {
    try {
      await _api.registerUser(userId, data);
    } catch (e) {
      throw Exception('유저 등록 실패: $e');
    }
  }

  /// 사용자 ID로 유저 등록 정보 조회
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
  Future<void> updateUser(String userId, UserRegistrationData data) async {
    try {
      await _api.updateUser(userId, data);
    } catch (e) {
      throw Exception('유저 등록 정보 수정 실패: $e');
    }
  }

  /// 유저 등록 정보 삭제
  Future<void> deleteUser(String userId) async {
    try {
      await _api.deleteUser(userId);
    } catch (e) {
      throw Exception('유저 등록 정보 삭제 실패: $e');
    }
  }
}
