// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get id => throw _privateConstructorUsedError;
  @PetTypeConverter()
  PetType? get type => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @PetGenderConverter()
  PetGender? get gender => throw _privateConstructorUsedError;
  bool get isNeutered => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  @PetBodyTypeConverter()
  PetBodyType? get bodyType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String id,
      @PetTypeConverter() PetType? type,
      String breed,
      String name,
      @PetGenderConverter() PetGender? gender,
      bool isNeutered,
      String? birthday,
      double? weight,
      @PetBodyTypeConverter() PetBodyType? bodyType});
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? breed = null,
    Object? name = null,
    Object? gender = freezed,
    Object? isNeutered = null,
    Object? birthday = freezed,
    Object? weight = freezed,
    Object? bodyType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PetType?,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender?,
      isNeutered: null == isNeutered
          ? _value.isNeutered
          : isNeutered // ignore: cast_nullable_to_non_nullable
              as bool,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as PetBodyType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetImplCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$PetImplCopyWith(_$PetImpl value, $Res Function(_$PetImpl) then) =
      __$$PetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @PetTypeConverter() PetType? type,
      String breed,
      String name,
      @PetGenderConverter() PetGender? gender,
      bool isNeutered,
      String? birthday,
      double? weight,
      @PetBodyTypeConverter() PetBodyType? bodyType});
}

/// @nodoc
class __$$PetImplCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$PetImpl>
    implements _$$PetImplCopyWith<$Res> {
  __$$PetImplCopyWithImpl(_$PetImpl _value, $Res Function(_$PetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? breed = null,
    Object? name = null,
    Object? gender = freezed,
    Object? isNeutered = null,
    Object? birthday = freezed,
    Object? weight = freezed,
    Object? bodyType = freezed,
  }) {
    return _then(_$PetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PetType?,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender?,
      isNeutered: null == isNeutered
          ? _value.isNeutered
          : isNeutered // ignore: cast_nullable_to_non_nullable
              as bool,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as PetBodyType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetImpl implements _Pet {
  const _$PetImpl(
      {required this.id,
      @PetTypeConverter() this.type,
      required this.breed,
      required this.name,
      @PetGenderConverter() this.gender,
      this.isNeutered = false,
      this.birthday,
      this.weight,
      @PetBodyTypeConverter() this.bodyType});

  factory _$PetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  @PetTypeConverter()
  final PetType? type;
  @override
  final String breed;
  @override
  final String name;
  @override
  @PetGenderConverter()
  final PetGender? gender;
  @override
  @JsonKey()
  final bool isNeutered;
  @override
  final String? birthday;
  @override
  final double? weight;
  @override
  @PetBodyTypeConverter()
  final PetBodyType? bodyType;

  @override
  String toString() {
    return 'Pet(id: $id, type: $type, breed: $breed, name: $name, gender: $gender, isNeutered: $isNeutered, birthday: $birthday, weight: $weight, bodyType: $bodyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isNeutered, isNeutered) ||
                other.isNeutered == isNeutered) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, breed, name, gender,
      isNeutered, birthday, weight, bodyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      __$$PetImplCopyWithImpl<_$PetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetImplToJson(
      this,
    );
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      {required final String id,
      @PetTypeConverter() final PetType? type,
      required final String breed,
      required final String name,
      @PetGenderConverter() final PetGender? gender,
      final bool isNeutered,
      final String? birthday,
      final double? weight,
      @PetBodyTypeConverter() final PetBodyType? bodyType}) = _$PetImpl;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$PetImpl.fromJson;

  @override
  String get id;
  @override
  @PetTypeConverter()
  PetType? get type;
  @override
  String get breed;
  @override
  String get name;
  @override
  @PetGenderConverter()
  PetGender? get gender;
  @override
  bool get isNeutered;
  @override
  String? get birthday;
  @override
  double? get weight;
  @override
  @PetBodyTypeConverter()
  PetBodyType? get bodyType;
  @override
  @JsonKey(ignore: true)
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
