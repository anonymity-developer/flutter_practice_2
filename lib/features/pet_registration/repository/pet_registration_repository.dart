import 'dart:async';
import '../models.dart';
import 'pet_registration_datasource.dart';
import 'package:rxdart/rxdart.dart';

/// 반려동물 등록 관련 데이터 처리
/// 나중에 API 연동 시 Repository에서 추가 로직을 담당
class PetRegistrationRepository {
  final PetRegistrationDataSource dataSource;
  final _petUpdateSubject = BehaviorSubject<String?>.seeded(null); // 마지막값 캐싱

  PetRegistrationRepository(this.dataSource);

  /// 펫 정보 업데이트 스트림 (userId를 emit)
  Stream<String?> get petUpdates => _petUpdateSubject.stream;
  
  /// BehaviorSubject의 현재 값 (마지막으로 emit된 userId) - 구독 시작 전에 마지막 값을 확인
  String? get lastUpdatedUserId => _petUpdateSubject.value;
  
  /// 반려동물 등록
  Future<Pet> registerPet(String userId, Pet pet) async {
    final result = await dataSource.registerPet(userId, pet);
    _petUpdateSubject.add(userId); // 변경 알림
    return result;
  }

  /// 사용자 ID로 반려동물 목록 조회
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    return dataSource.getPetDataByUserId(userId);
  }

  /// 반려동물 정보 수정
  Future<Pet> updatePet(String userId, String petId, Pet pet) async {
    final result = await dataSource.updatePet(petId, pet);
    _petUpdateSubject.add(userId); // 변경 알림
    return result;
  }

  /// 반려동물 삭제
  Future<void> deletePet(String userId, String petId) async {
    await dataSource.deletePet(petId);
    _petUpdateSubject.add(userId); // 변경 알림
  }

  /// 반려동물 품종 목록 조회
  List<String> getBreeds(PetType type) {
    return dataSource.getBreeds(type);
  }

  /// 스트림 업데이트 트리거 - BehaviorSubject에 userId를 emit하여 스트림을 통해 데이터 로드
  void triggerUpdate(String userId) {
    _petUpdateSubject.add(userId);
  }

  /// 리소스 정리
  void dispose() {
    _petUpdateSubject.close();
  }
}

