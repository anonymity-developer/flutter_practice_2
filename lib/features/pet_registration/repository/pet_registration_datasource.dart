import '../models.dart';

/// 반려동물 등록 데이터 저장소 인터페이스
abstract class PetRegistrationDataSource {
  /// 반려동물 품종 목록 조회
  Future<List<String>> getBreeds(PetType type);

  /// 반려동물 등록
  Future<Pet> registerPet(String userId, Pet pet);

  /// 사용자 ID로 반려동물 목록 조회
  Future<List<Pet>> getPetDataByUserId(String userId);

  /// 반려동물 정보 수정
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet);

  /// 반려동물 삭제
  Future<void> deletePet(String userId, String petSystemId);
}

