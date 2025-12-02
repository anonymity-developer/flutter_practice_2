import 'dart:async';
import '../models.dart';
import 'pet_registration_datasource.dart';
import 'pet_registration_repository.dart';
import 'package:rxdart/rxdart.dart';

/// 반려동물 등록 관련 데이터 처리 구현체
class PetRegistrationRepositoryImpl implements PetRegistrationRepository {
  final PetRegistrationDataSource dataSource;
  final _petUpdateSubject = BehaviorSubject<String?>.seeded(null);

  PetRegistrationRepositoryImpl(this.dataSource);

  @override
  Stream<String?> get petUpdates => _petUpdateSubject.stream;

  @override
  String? get lastUpdatedUserId => _petUpdateSubject.value;

  @override
  Future<Pet> registerPet(String userId, Pet pet) async {
    try {
      final result = await dataSource.registerPet(userId, pet);
      _petUpdateSubject.add(userId); 
      return result;
    } catch (e) {
      rethrow; 
    }
  }

  @override
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    try {
      return await dataSource.getPetDataByUserId(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet) async {
    try {
      final result = await dataSource.updatePet(userId, petSystemId, pet);
      _petUpdateSubject.add(userId); 
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePet(String userId, String petSystemId) async {
    try {
      await dataSource.deletePet(userId, petSystemId);
      _petUpdateSubject.add(userId); 
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getBreeds(PetType type) async {
    try {
      return await dataSource.getBreeds(type);
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

