// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PetRegistrationState {
  Pet? get pet => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PetRegistrationStateCopyWith<PetRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetRegistrationStateCopyWith<$Res> {
  factory $PetRegistrationStateCopyWith(PetRegistrationState value,
          $Res Function(PetRegistrationState) then) =
      _$PetRegistrationStateCopyWithImpl<$Res, PetRegistrationState>;
  @useResult
  $Res call({Pet? pet, bool isLoading, String? error});

  $PetCopyWith<$Res>? get pet;
}

/// @nodoc
class _$PetRegistrationStateCopyWithImpl<$Res,
        $Val extends PetRegistrationState>
    implements $PetRegistrationStateCopyWith<$Res> {
  _$PetRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      pet: freezed == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PetCopyWith<$Res>? get pet {
    if (_value.pet == null) {
      return null;
    }

    return $PetCopyWith<$Res>(_value.pet!, (value) {
      return _then(_value.copyWith(pet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PetRegistrationStateImplCopyWith<$Res>
    implements $PetRegistrationStateCopyWith<$Res> {
  factory _$$PetRegistrationStateImplCopyWith(_$PetRegistrationStateImpl value,
          $Res Function(_$PetRegistrationStateImpl) then) =
      __$$PetRegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pet? pet, bool isLoading, String? error});

  @override
  $PetCopyWith<$Res>? get pet;
}

/// @nodoc
class __$$PetRegistrationStateImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res, _$PetRegistrationStateImpl>
    implements _$$PetRegistrationStateImplCopyWith<$Res> {
  __$$PetRegistrationStateImplCopyWithImpl(_$PetRegistrationStateImpl _value,
      $Res Function(_$PetRegistrationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$PetRegistrationStateImpl(
      pet: freezed == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PetRegistrationStateImpl implements _PetRegistrationState {
  const _$PetRegistrationStateImpl(
      {this.pet, this.isLoading = false, this.error});

  @override
  final Pet? pet;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'PetRegistrationState(pet: $pet, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationStateImpl &&
            (identical(other.pet, pet) || other.pet == pet) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pet, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetRegistrationStateImplCopyWith<_$PetRegistrationStateImpl>
      get copyWith =>
          __$$PetRegistrationStateImplCopyWithImpl<_$PetRegistrationStateImpl>(
              this, _$identity);
}

abstract class _PetRegistrationState implements PetRegistrationState {
  const factory _PetRegistrationState(
      {final Pet? pet,
      final bool isLoading,
      final String? error}) = _$PetRegistrationStateImpl;

  @override
  Pet? get pet;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PetRegistrationStateImplCopyWith<_$PetRegistrationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
