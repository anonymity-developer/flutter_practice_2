import 'package:hive_flutter/hive_flutter.dart';
import '../models.dart';
import 'pet_registration_datasource.dart';

/// Hive 사용 반려동물 등록 데이터 저장소
/// 개별 Pet 저장 방식: Key = "${userId}_${petId}"
class PetRegistrationDataSourceHive implements PetRegistrationDataSource {
  static const String _boxName = 'pets';
  Box<Pet>? _box;

  Future<void> _ensureBox() async {
    _box ??= await Hive.openBox<Pet>(_boxName);
  }

  /// Key 생성: "${userId}_${petId}"
  String _makeKey(String userId, String petId) => '${userId}_$petId';

  /// userId로 시작하는 모든 키 찾기
  List<String> _findKeysByUserId(String userId) {
    if (_box == null) return [];
    return _box!.keys
        .where((key) => key is String && key.startsWith('${userId}_'))
        .cast<String>()
        .toList();
  }

  @override
  Future<List<String>> getBreeds(PetType type) async {
    // 품종 목록은 서버에서만 가져오므로 Hive에서는 빈 리스트 반환
    return [];
  }

  @override
  Future<Pet> registerPet(String userId, Pet pet) async {
    await _ensureBox();
    final key = _makeKey(userId, pet.id);
    await _box!.put(key, pet);
    return pet;
  }

  @override
  Future<List<Pet>> getPetDataByUserId(String userId) async {
    await _ensureBox();
    final keys = _findKeysByUserId(userId);
    return keys.map((key) => _box!.get(key)!).whereType<Pet>().toList();
  }

  @override
  Future<Pet?> getPet(String userId, String petSystemId) async {
    await _ensureBox();
    final key = _makeKey(userId, petSystemId);
    return _box!.get(key);
  }

  @override
  Future<Pet> updatePet(String userId, String petSystemId, Pet pet) async {
    await _ensureBox();
    final key = _makeKey(userId, petSystemId);
    await _box!.put(key, pet);
    return pet;
  }

  @override
  Future<void> deletePet(String userId, String petSystemId) async {
    await _ensureBox();
    final key = _makeKey(userId, petSystemId);
    await _box!.delete(key);
  }

  /// userId의 모든 Pet 삭제 (동기화용, 효율적)
  Future<void> deleteAllPetsByUserId(String userId) async {
    await _ensureBox();
    final keys = _findKeysByUserId(userId);
    for (final key in keys) {
      await _box!.delete(key);
    }
  }
}

