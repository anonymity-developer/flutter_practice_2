/// Pet 관련 Enum
enum PetType {
  dog,
  cat,
}

enum PetGender {
  male,
  female,
}

enum PetBodyType {
  veryThin,
  thin,
  ideal,
  overWeight,
  obese,
}

/// Pet 모델
class Pet {
  final String id;
  final PetType type;
  final String breed;
  final String name;
  final PetGender gender;
  final bool isNeutered;

  final String? birthday;
  final double? weight;
  final PetBodyType? bodyType;

  Pet({
    required this.id,
    required this.type,
    required this.breed,
    required this.name,
    required this.gender,
    required this.isNeutered,
    this.birthday,
    this.weight,
    this.bodyType,
  });

  Pet copyWith({
    String? id,
    PetType? type,
    String? breed,
    String? name,
    PetGender? gender,
    bool? isNeutered,
    String? birthday,
    double? weight,
    PetBodyType? bodyType,
  }) {
    return Pet(
      id: id ?? this.id,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      isNeutered: isNeutered ?? this.isNeutered,
      birthday: birthday ?? this.birthday,
      weight: weight ?? this.weight,
      bodyType: bodyType ?? this.bodyType,
    );
  }
}

