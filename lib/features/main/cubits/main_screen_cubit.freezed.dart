// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MainScreenState {
  UserRegistrationData get userData => throw _privateConstructorUsedError;
  List<Pet> get pets => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
    MainScreenState value,
    $Res Function(MainScreenState) then,
  ) = _$MainScreenStateCopyWithImpl<$Res, MainScreenState>;
  @useResult
  $Res call({
    UserRegistrationData userData,
    List<Pet> pets,
    bool isLoading,
    String? error,
  });
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res, $Val extends MainScreenState>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
    Object? pets = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            userData: null == userData
                ? _value.userData
                : userData // ignore: cast_nullable_to_non_nullable
                      as UserRegistrationData,
            pets: null == pets
                ? _value.pets
                : pets // ignore: cast_nullable_to_non_nullable
                      as List<Pet>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MainScreenStateImplCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$$MainScreenStateImplCopyWith(
    _$MainScreenStateImpl value,
    $Res Function(_$MainScreenStateImpl) then,
  ) = __$$MainScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserRegistrationData userData,
    List<Pet> pets,
    bool isLoading,
    String? error,
  });
}

/// @nodoc
class __$$MainScreenStateImplCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res, _$MainScreenStateImpl>
    implements _$$MainScreenStateImplCopyWith<$Res> {
  __$$MainScreenStateImplCopyWithImpl(
    _$MainScreenStateImpl _value,
    $Res Function(_$MainScreenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
    Object? pets = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$MainScreenStateImpl(
        userData: null == userData
            ? _value.userData
            : userData // ignore: cast_nullable_to_non_nullable
                  as UserRegistrationData,
        pets: null == pets
            ? _value._pets
            : pets // ignore: cast_nullable_to_non_nullable
                  as List<Pet>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MainScreenStateImpl implements _MainScreenState {
  const _$MainScreenStateImpl({
    this.userData = const UserRegistrationData(),
    final List<Pet> pets = const <Pet>[],
    this.isLoading = false,
    this.error,
  }) : _pets = pets;

  @override
  @JsonKey()
  final UserRegistrationData userData;
  final List<Pet> _pets;
  @override
  @JsonKey()
  List<Pet> get pets {
    if (_pets is EqualUnmodifiableListView) return _pets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pets);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'MainScreenState(userData: $userData, pets: $pets, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenStateImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality().equals(other._pets, _pets) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userData,
    const DeepCollectionEquality().hash(_pets),
    isLoading,
    error,
  );

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainScreenStateImplCopyWith<_$MainScreenStateImpl> get copyWith =>
      __$$MainScreenStateImplCopyWithImpl<_$MainScreenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MainScreenState implements MainScreenState {
  const factory _MainScreenState({
    final UserRegistrationData userData,
    final List<Pet> pets,
    final bool isLoading,
    final String? error,
  }) = _$MainScreenStateImpl;

  @override
  UserRegistrationData get userData;
  @override
  List<Pet> get pets;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of MainScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainScreenStateImplCopyWith<_$MainScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
