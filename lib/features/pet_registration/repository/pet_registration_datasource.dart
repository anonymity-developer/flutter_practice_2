import '../models.dart';

/// 반려동물 등록 데이터 저장소
/// 나중에 API 연동 시 여기서 HTTP 요청 처리
class PetRegistrationDataSource {
  /// 반려동물 등록 (API 연동 시 사용)
  Future<Pet> registerPet(Pet pet) async {
    // TODO: API 연동 시 구현
    // 예: return await apiClient.post('/pets', pet.toJson());
    return pet;
  }

  /// 반려동물 목록 조회 (API 연동 시 사용)
  Future<List<Pet>> getPets() async {
    // TODO: API 연동 시 구현
    // 예: return await apiClient.get('/pets');
    return [];
  }

  /// 반려동물 정보 수정 (API 연동 시 사용)
  Future<Pet> updatePet(Pet pet) async {
    // TODO: API 연동 시 구현
    // 예: return await apiClient.put('/pets/${pet.id}', pet.toJson());
    return pet;
  }

  /// 반려동물 삭제 (API 연동 시 사용)
  Future<void> deletePet(String petId) async {
    // TODO: API 연동 시 구현
    // 예: return await apiClient.delete('/pets/$petId');
  }
}

