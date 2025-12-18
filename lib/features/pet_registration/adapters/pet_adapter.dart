import 'package:hive/hive.dart';
import '../models.dart';

/// Hive TypeAdapter
class PetAdapter extends TypeAdapter<Pet> {
  @override
  final int typeId = 1;

  @override
  Pet read(BinaryReader reader) {
    final json = reader.readMap();
    return Pet.fromJson(
      Map<String, dynamic>.from(json),
    ); // freezed 모델의 fromJson 메서드 사용
  }

  @override
  void write(BinaryWriter writer, Pet obj) {
    writer.writeMap(obj.toJson()); // freezed 모델의 toJson 메서드 사용
  }
}

