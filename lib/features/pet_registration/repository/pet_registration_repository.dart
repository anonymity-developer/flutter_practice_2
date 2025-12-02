import '../models.dart';

/// 반려동물 등록 관련 데이터 처리 인터페이스
abstract class PetRegistrationRepository {
  /// 펫 정보 업데이트 스트림 (userId를 emit)
  Stream<String?> get petUpdates;

  /// BehaviorSubject의 현재 값 (마지막으로 emit된 userId) - 구독 시작 전에 마지막 값을 확인
  String? get lastUpdatedUserId;

  /// 반려동물 등록
  Future<Pet> registerPet(String userId, Pet pet);

  /// 사용자 ID로 반려동물 목록 조회
  Future<List<Pet>> getPetDataByUserId(String userId);

  /// 반려동물 정보 수정
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet);

  /// 반려동물 삭제
  Future<void> deletePet(String userId, String petSystemId);

  /// 반려동물 품종 목록 조회
  Future<List<String>> getBreeds(PetType type);

  /// 스트림 업데이트 트리거 - BehaviorSubject에 userId를 emit하여 스트림을 통해 데이터 로드
  void triggerUpdate(String userId);

  /// 리소스 정리
  void dispose();
}
