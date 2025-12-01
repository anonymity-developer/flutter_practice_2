import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api/pet_registration_api.dart';
import 'package:flutter_application_2/core/config/api_config.dart';
import '../models.dart';

/// 반려동물 등록 데이터 저장소
/// Retrofit을 통한 API 호출
class PetRegistrationDataSource {
  final PetRegistrationApi _api;

  /// Pet 종류 목록 (목데이터)
  static const List<String> _dogBreeds = [
    '강아지1',
    '강아지2',
    '강아지3',
    '강아지4',
    '강아지5',
    '강아지6',
    '강아지7',
    '강아지8',
    '강아지9',
    '강아지10',
  ];

  static const List<String> _catBreeds = [
    '고양이1',
    '고양이2',
    '고양이3',
    '고양이4',
    '고양이5',
    '고양이6',
    '고양이7',
    '고양이8',
    '고양이9',
    '고양이10',
  ];

  PetRegistrationDataSource()
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
  List<String> getBreeds(PetType type) {
    return type == PetType.dog ? _dogBreeds : _catBreeds;
  }

  /// 반려동물 등록
  Future<Pet> registerPet(String userId, Pet pet) async {
    try {
      final registeredPet = await _api.registerPet(userId, pet);
      return registeredPet;
    } catch (e) {
      throw Exception('반려동물 등록 실패: $e');
    }
  }

  /// 사용자 ID로 반려동물 목록 조회
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
  Future<Pet> updatePet(String petId, Pet pet) async {
    try {
      final updatedPet = await _api.updatePet(petId, pet);
      return updatedPet;
    } catch (e) {
      throw Exception('반려동물 정보 수정 실패: $e');
    }
  }

  /// 반려동물 삭제
  Future<void> deletePet(String petId) async {
    try {
      await _api.deletePet(petId);
    } catch (e) {
      throw Exception('반려동물 삭제 실패: $e');
    }
  }
}

