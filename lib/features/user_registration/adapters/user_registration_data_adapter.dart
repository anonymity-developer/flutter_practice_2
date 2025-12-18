import 'package:hive/hive.dart';
import '../models.dart';

/// Hive TypeAdapter
class UserRegistrationDataAdapter extends TypeAdapter<UserRegistrationData> {
  @override
  final int typeId = 0;

  @override
  UserRegistrationData read(BinaryReader reader) {
    final json = reader.readMap();
    return UserRegistrationData.fromJson(
      Map<String, dynamic>.from(json),
    ); // freezed 모델의 fromJson 메서드 사용
  }

  @override
  void write(BinaryWriter writer, UserRegistrationData obj) {
    writer.writeMap(obj.toJson()); // freezed 모델의 toJson 메서드 사용
  }
}

