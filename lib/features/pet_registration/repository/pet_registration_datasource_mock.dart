import '../models.dart';
import 'pet_registration_datasource.dart';

class PetRegistrationDataSourceMock implements PetRegistrationDataSource {

  final Map<String, String> _userLoginIdToSystemIdMap = {
    'test1': '1',
    'test2': '2',
  };

  final Map<String, List<Pet>> _mockData = {
    '1': [
      const Pet(
        id: '1',
        type: PetType.dog,
        breed: 'mock 강아지1',
        name: 'mock 강아지1',
        gender: PetGender.male,
        isNeutered: false,
        birthday: '2025-01-01',
        weight: 10.0,
        bodyType: PetBodyType.ideal, 
      ),
      const Pet(
        id: '2',
        type: PetType.cat,
        breed: 'mock 고양이1',
        name: 'mock 고양이1',
        gender: PetGender.female,
        isNeutered: false,  
        birthday: '2025-01-01',  
        weight: 10.0,  
        bodyType: PetBodyType.ideal,  
      ),
    ],
  };

  int _petIdCounter = 3;

  // Mock용 품종 목록
  static const List<String> _dogBreeds = [
    'mock 강아지1',
    'mock 강아지2',
    'mock 강아지3',
    'mock 강아지4',
    'mock 강아지5',
    'mock 강아지6',
    'mock 강아지7',
    'mock 강아지8',
    'mock 강아지9',
    'mock 강아지10',
  ];

  static const List<String> _catBreeds = [
    'mock 고양이1',
    'mock 고양이2',
    'mock 고양이3',
    'mock 고양이4',
    'mock 고양이5',
    'mock 고양이6',
    'mock 고양이7',
    'mock 고양이8',
    'mock 고양이9',
    'mock 고양이10',
  ];

  String? _getUserSystemIdByLoginId(String userLoginId) {
    return _userLoginIdToSystemIdMap[userLoginId];
  }

  @override
  Future<List<String>> getBreeds(PetType type) async {
    return type == PetType.dog ? _dogBreeds : _catBreeds;
  }

  @override
  Future<Pet> registerPet(String userId, Pet pet) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null) {
      throw Exception('반려동물 등록 실패: 사용자를 찾을 수 없습니다.');
    }
    
    final newPet = pet.copyWith(id: _petIdCounter.toString());
    _petIdCounter++;
    
    _mockData.putIfAbsent(userSystemId, () => []).add(newPet);
    return newPet;
  }

  @override
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    if (userSystemId == null) {
      return [];
    }
    return _mockData[userSystemId] ?? [];
  }

  @override
  Future<Pet?> getPet(String userId, String petSystemId) async {
    final pets = await getPetDataByUserId(userId);
    try {
      return pets.firstWhere((pet) => pet.id == petSystemId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    final pets = userSystemId != null ? _mockData[userSystemId] : null;
    final index = pets?.indexWhere((p) => p.id == petSystemId) ?? -1;
    
    if (userSystemId == null || index == -1) {
      throw Exception('반려동물 정보 수정 실패: 등록 정보를 찾을 수 없습니다.');
    }
    
    final updatedPet = pet.copyWith(id: petSystemId);
    pets![index] = updatedPet;
    return updatedPet;
  }

  @override
  Future<void> deletePet(String userId, String petSystemId) async {
    final userSystemId = _getUserSystemIdByLoginId(userId);
    final pets = userSystemId != null ? _mockData[userSystemId] : null;
    final index = pets?.indexWhere((p) => p.id == petSystemId) ?? -1;
    
    if (userSystemId == null || index == -1) {
      throw Exception('반려동물 삭제 실패: 등록 정보를 찾을 수 없습니다.');
    }
    
    pets!.removeAt(index);
  }
}
