import 'dart:async';
import '../models.dart';
import 'pet_registration_datasource.dart';
import 'pet_registration_datasource_hive.dart';
import 'pet_registration_repository.dart';
import 'package:rxdart/rxdart.dart';

/// 반려동물 등록 관련 데이터 처리 구현체
/// 로컬(Hive)과 서버(API/Mock) 두 DataSource를 조합하여 사용
class PetRegistrationRepositoryImpl implements PetRegistrationRepository {
  final PetRegistrationDataSource apiDataSource;
  final PetRegistrationDataSource hiveDataSource;
  final _petUpdateSubject = BehaviorSubject<String?>.seeded(null);

  PetRegistrationRepositoryImpl({
    required this.apiDataSource,
    required this.hiveDataSource,
  });

  @override
  Stream<String?> get petUpdates => _petUpdateSubject.stream;

  @override
  String? get lastUpdatedUserId => _petUpdateSubject.value;

  @override
  Future<Pet> registerPet(String userId, Pet pet) async {
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.registerPet(userId, pet);
      _petUpdateSubject.add(userId);
      final result = await apiDataSource.registerPet(userId, pet);
      
      // 서버 ID가 다를 경우 로컬 데이터 업데이트
      if (result.id != pet.id) {
        await hiveDataSource.deletePet(userId, pet.id);
        await hiveDataSource.registerPet(userId, result);
        _petUpdateSubject.add(userId);
      }
      
      return result;
    } catch (e) {
      await hiveDataSource.deletePet(userId, pet.id);
      _petUpdateSubject.add(userId);
      rethrow;
    }
  }

  @override
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    try {
      // 로컬 데이터 조회 -> 서버 동기화 (백그라운드) -> 로컬 데이터 반환
      final localPets = await hiveDataSource.getPetDataByUserId(userId);
      _syncFromServer(userId);
      return localPets;
    } catch (e) {
      rethrow;
    }
  }

  /// 서버에서 데이터를 가져와 로컬에 저장하고 스트림으로 알림
  /// 차이점만 업데이트하여 효율성 개선
  Future<void> _syncFromServer(String userId) async {
    try {
      final localPets = await hiveDataSource.getPetDataByUserId(userId);
      final serverPets = await apiDataSource.getPetDataByUserId(userId);
      
      // 서버 Pet을 ID로 매핑
      final serverPetsMap = {for (var pet in serverPets) pet.id: pet};
      final localPetsMap = {for (var pet in localPets) pet.id: pet};
      
      bool hasChanges = false;
      
      // 삭제: 로컬에만 있는 Pet 삭제
      for (final localPet in localPets) {
        if (!serverPetsMap.containsKey(localPet.id)) {
          await hiveDataSource.deletePet(userId, localPet.id);
          hasChanges = true;
        }
      }
      
      // 추가/업데이트: 서버에 있는 Pet 추가 또는 업데이트
      for (final serverPet in serverPets) {
        final localPet = localPetsMap[serverPet.id];
        if (localPet == null) {
          // 추가
          await hiveDataSource.registerPet(userId, serverPet);
          hasChanges = true;
        } else if (localPet != serverPet) {
          // 업데이트 (내용이 다른 경우만)
          await hiveDataSource.updatePet(userId, serverPet.id, serverPet);
          hasChanges = true;
        }
        // 같으면 건너뛰기
      }
      
      // 변경사항이 있을 때만 UI 업데이트
      if (hasChanges) {
        _petUpdateSubject.add(userId);
      }
    } catch (e) {
      // 서버 동기화 실패해도 로컬 데이터는 유지, 에러는 무시(오프라인 모드 지원)
    }
  }

  @override
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet) async {
    // 롤백용 기존 데이터 백업
    final previousPet = await hiveDataSource.getPet(userId, petSystemId);
    
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.updatePet(userId, petSystemId, pet);
      _petUpdateSubject.add(userId);
      final result = await apiDataSource.updatePet(userId, petSystemId, pet);
      return result;
    } catch (e) {
      if (previousPet != null) {
        await hiveDataSource.updatePet(userId, petSystemId, previousPet);
        _petUpdateSubject.add(userId);
      }
      rethrow;
    }
  }

  @override
  Future<void> deletePet(String userId, String petSystemId) async {
    // 롤백용 기존 데이터 백업
    final previousPet = await hiveDataSource.getPet(userId, petSystemId);
    
    try {
      // 낙관적 업데이트: 로컬 저장 -> UI 업데이트 -> 서버 동기화 -> (실패 시 롤백)
      await hiveDataSource.deletePet(userId, petSystemId);
      _petUpdateSubject.add(userId);
      await apiDataSource.deletePet(userId, petSystemId);
    } catch (e) {
      if (previousPet != null) {
        await hiveDataSource.registerPet(userId, previousPet);
        _petUpdateSubject.add(userId);
      }
      rethrow;
    }
  }

  @override
  Future<List<String>> getBreeds(PetType type) async {
    // 품종 목록은 서버에서만 가져옴
    try {
      return await apiDataSource.getBreeds(type);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void triggerUpdate(String userId) {
    _petUpdateSubject.add(userId);
  }

  @override
  void dispose() {
    _petUpdateSubject.close();
  }
}

