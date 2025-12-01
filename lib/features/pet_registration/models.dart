import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// Pet 관련 Enum
enum PetType {
  dog,
  cat;
}

enum PetGender {
  male,
  female;
}

enum PetBodyType {
  veryThin,
  thin,
  ideal,
  overWeight,
  obese;
}

/// type/gender/bodyType JSON 변환기 -> 기본값 처리, nullable enum 처리를 위해 사용
class PetTypeConverter implements JsonConverter<PetType?, String?> {
  const PetTypeConverter();

  @override
  PetType? fromJson(String? json) {
    if (json == null) return null;
    return PetType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => PetType.dog,
    );
  }

  @override
  String? toJson(PetType? object) => object?.name;
}
class PetGenderConverter implements JsonConverter<PetGender?, String?> {
  const PetGenderConverter();

  @override
  PetGender? fromJson(String? json) {
    if (json == null) return null;
    return PetGender.values.firstWhere(
      (e) => e.name == json,
      orElse: () => PetGender.male,
    );
  }

  @override
  String? toJson(PetGender? object) => object?.name;
}

class PetBodyTypeConverter implements JsonConverter<PetBodyType?, String?> {
  const PetBodyTypeConverter();

  @override
  PetBodyType? fromJson(String? json) {
    if (json == null) return null;
    return PetBodyType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => PetBodyType.ideal,
    );
  }

  @override
  String? toJson(PetBodyType? object) => object?.name;
}

/// Pet 모델
@freezed
class Pet with _$Pet {
  const factory Pet({
    required String id,
    @PetTypeConverter() PetType? type,
    required String breed,
    required String name,
    @PetGenderConverter() PetGender? gender,
    @Default(false) bool isNeutered,
    String? birthday,
    double? weight,
    @PetBodyTypeConverter() PetBodyType? bodyType,
  }) = _Pet;

  /// 빈 Pet 객체 생성
  factory Pet.empty() {
    return const Pet(
      id: '',
      type: null,
      breed: '',
      name: '',
      gender: null,
      isNeutered: false,
    );
  }

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
