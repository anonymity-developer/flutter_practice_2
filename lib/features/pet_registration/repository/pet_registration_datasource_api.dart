import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api/pet_registration_api.dart';
import 'package:flutter_application_2/core/config/api_config.dart';
import '../models.dart';
import 'pet_registration_datasource.dart';

/// 반려동물 등록 데이터 저장소
/// Retrofit을 통한 API 호출
class PetRegistrationDataSourceApi implements PetRegistrationDataSource {
  final PetRegistrationApi _api;

  PetRegistrationDataSourceApi()
      : _api = PetRegistrationApi(
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


  /// 반려동물 품종 목록 조회
  @override
  Future<List<String>> getBreeds(PetType type) async {
    try {
      return await _api.getBreeds(type.name);
    } on DioException catch (e) {
      throw Exception('반려동물 품종 목록 조회 실패: ${e.message}');
    } catch (e) {
      throw Exception('반려동물 품종 목록 조회 실패: $e');
    }
  }

  /// 반려동물 등록
  @override
  Future<Pet> registerPet(String userId, Pet pet) async {
    try {
      final registeredPet = await _api.registerPet(userId, pet);
      return registeredPet;
    } on DioException catch (e) {
      throw Exception('반려동물 등록 실패: ${e.message}');
    } catch (e) {
      throw Exception('반려동물 등록 실패: $e');
    }
  }

  /// 사용자 ID로 반려동물 목록 조회
  @override
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    try {
      final pets = await _api.getPetsByUserId(userId);
      return List<Pet>.from(pets); // 새 리스트 생성
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      throw Exception('반려동물 정보 조회 실패: ${e.message}');
    } catch (e) {
      throw Exception('반려동물 정보 조회 실패: $e');
    }
  }

  /// 반려동물 정보 수정
  @override
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet) async {
    try {
      final updatedPet = await _api.updatePet(userId, petSystemId, pet);
      return updatedPet;
    } on DioException catch (e) {
      throw Exception('반려동물 정보 수정 실패: ${e.message}');
    } catch (e) {
      throw Exception('반려동물 정보 수정 실패: $e');
    }
  }

  /// 반려동물 삭제
  @override
  Future<void> deletePet(String userId, String petSystemId) async {
    try {
      await _api.deletePet(userId, petSystemId);
    } on DioException catch (e) {
      throw Exception('반려동물 삭제 실패: ${e.message}');
    } catch (e) {
      throw Exception('반려동물 삭제 실패: $e');
    }
  }
}

