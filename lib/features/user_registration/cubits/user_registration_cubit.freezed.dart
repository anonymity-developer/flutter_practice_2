// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserRegistrationState {
  UserRegistrationData get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRegistrationStateCopyWith<UserRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationStateCopyWith<$Res> {
  factory $UserRegistrationStateCopyWith(UserRegistrationState value,
          $Res Function(UserRegistrationState) then) =
      _$UserRegistrationStateCopyWithImpl<$Res, UserRegistrationState>;
  @useResult
  $Res call({UserRegistrationData data, bool isLoading, String? error});

  $UserRegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserRegistrationStateCopyWithImpl<$Res,
        $Val extends UserRegistrationState>
    implements $UserRegistrationStateCopyWith<$Res> {
  _$UserRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRegistrationData,
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
  $UserRegistrationDataCopyWith<$Res> get data {
    return $UserRegistrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRegistrationStateImplCopyWith<$Res>
    implements $UserRegistrationStateCopyWith<$Res> {
  factory _$$UserRegistrationStateImplCopyWith(
          _$UserRegistrationStateImpl value,
          $Res Function(_$UserRegistrationStateImpl) then) =
      __$$UserRegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserRegistrationData data, bool isLoading, String? error});

  @override
  $UserRegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserRegistrationStateImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationStateImpl>
    implements _$$UserRegistrationStateImplCopyWith<$Res> {
  __$$UserRegistrationStateImplCopyWithImpl(_$UserRegistrationStateImpl _value,
      $Res Function(_$UserRegistrationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$UserRegistrationStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRegistrationData,
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

class _$UserRegistrationStateImpl implements _UserRegistrationState {
  const _$UserRegistrationStateImpl(
      {this.data = const UserRegistrationData(),
      this.isLoading = false,
      this.error});

  @override
  @JsonKey()
  final UserRegistrationData data;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'UserRegistrationState(data: $data, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationStateImplCopyWith<_$UserRegistrationStateImpl>
      get copyWith => __$$UserRegistrationStateImplCopyWithImpl<
          _$UserRegistrationStateImpl>(this, _$identity);
}

abstract class _UserRegistrationState implements UserRegistrationState {
  const factory _UserRegistrationState(
      {final UserRegistrationData data,
      final bool isLoading,
      final String? error}) = _$UserRegistrationStateImpl;

  @override
  UserRegistrationData get data;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$UserRegistrationStateImplCopyWith<_$UserRegistrationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
