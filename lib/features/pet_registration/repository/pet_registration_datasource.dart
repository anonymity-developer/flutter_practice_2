import '../models.dart';

/// 반려동물 등록 데이터 저장소
/// 나중에 API 연동 시 여기서 HTTP 요청 처리
class PetRegistrationDataSource {
  /// Pet 종류 목록 (목데이터)
  /// 나중에 API 연동 시 서버에서 가져오도록 변경
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

  /// 반려동물 품종 목록 조회
  List<String> getBreeds(PetType type) {
    return type == PetType.dog ? _dogBreeds : _catBreeds;
  }
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

  /// 사용자 ID로 반려동물 목록 조회 (목데이터)
  Future<List<Pet>> getPetsByUserId(String userId) async {
    // 목데이터: test2(id: '2')의 펫 정보
    if (userId == '2') {
      return [
        Pet(
          id: '2',
          type: PetType.dog,
          breed: '강아지2',
          name: '테스트2 강아지',
          gender: PetGender.male,
          isNeutered: true,
          birthday: '2020-01-01',
          weight: 10,
          bodyType: PetBodyType.ideal,
        ),
      ];
    }
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

