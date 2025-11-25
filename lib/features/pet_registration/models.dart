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

/// Pet 종류 목록
class PetBreeds {
  static const List<String> dogBreeds = [
    '강아지1',
    '강아지2',
    '강아지3',
    '강아지4',
    '강아지5',
    '강아지6',
    '강아지7',
    '강아지8',
    '강아지9',
    '강아지10',
  ];

  static const List<String> catBreeds = [
    '고양이1',
    '고양이2',
    '고양이3',
    '고양이4',
    '고양이5',
    '고양이6',
    '고양이7',
    '고양이8',
    '고양이9',
    '고양이10',
  ];

  static List<String> getBreeds(PetType type) {
    return type == PetType.dog ? dogBreeds : catBreeds;
  }
}

