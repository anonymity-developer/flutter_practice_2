/// Pet 관련 Enum
enum PetType {
  dog,
  cat;

  static PetType fromString(String value) {
    return PetType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => PetType.dog,
    );
  }
}

enum PetGender {
  male,
  female;

  static PetGender fromString(String value) {
    return PetGender.values.firstWhere(
      (e) => e.name == value,
      orElse: () => PetGender.male,
    );
  }
}

enum PetBodyType {
  veryThin,
  thin,
  ideal,
  overWeight,
  obese;

  static PetBodyType? fromString(String? value) {
    if (value == null) return null;
    return PetBodyType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => PetBodyType.ideal,
    );
  }
}

/// Pet 모델
class Pet {
  final String id;
  final PetType? type;
  final String breed;
  final String name;
  final PetGender? gender;
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

  /// 빈 Pet 객체 생성
  factory Pet.empty() {
    return Pet(
      id: '',
      type: null,
      breed: '',
      name: '',
      gender: null,
      isNeutered: false,
    );
  }

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

  /// JSON에서 Pet로 변환
  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as String,
      type: PetType.fromString(json['type'] as String),
      breed: json['breed'] as String,
      name: json['name'] as String,
      gender: PetGender.fromString(json['gender'] as String),
      isNeutered: json['isNeutered'] as bool,
      birthday: json['birthday'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      bodyType: PetBodyType.fromString(json['bodyType'] as String?),
    );
  }

  /// Pet를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type?.name,
      'breed': breed,
      'name': name,
      'gender': gender?.name,
      'isNeutered': isNeutered,
      'birthday': birthday,
      'weight': weight,
      'bodyType': bodyType?.name,
    };
  }
}

