import '../models.dart';
import 'pet_registration_datasource.dart';

/// 반려동물 등록 관련 데이터 처리
/// 나중에 API 연동 시 Repository에서 추가 로직을 담당
class PetRegistrationRepository {
  final PetRegistrationDataSource dataSource;

  PetRegistrationRepository(this.dataSource);

  /// 반려동물 등록
  Future<Pet> registerPet(Pet pet) async {
    // TODO: 필요 시 검증/데이터 변환 로직 추가
    return dataSource.registerPet(pet);
  }

  /// 반려동물 목록 조회
  Future<List<Pet>> getPets() async {
    return dataSource.getPets();
  }

  /// 반려동물 정보 수정
  Future<Pet> updatePet(Pet pet) async {
    return dataSource.updatePet(pet);
  }

  /// 반려동물 삭제
  Future<void> deletePet(String petId) async {
    return dataSource.deletePet(petId);
  }

  /// 반려동물 품종 목록 조회
  List<String> getBreeds(PetType type) {
    return dataSource.getBreeds(type);
  }

  /// 사용자 ID로 반려동물 목록 조회
  Future<List<Pet>> getPetsByUserId(String userId) async {
    return dataSource.getPetsByUserId(userId);
  }
}

