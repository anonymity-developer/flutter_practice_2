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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationStateCopyWith<$Res> {
  factory $UserRegistrationStateCopyWith(UserRegistrationState value,
          $Res Function(UserRegistrationState) then) =
      _$UserRegistrationStateCopyWithImpl<$Res, UserRegistrationState>;
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
}

/// @nodoc
abstract class _$$UserRegistrationInitialImplCopyWith<$Res> {
  factory _$$UserRegistrationInitialImplCopyWith(
          _$UserRegistrationInitialImpl value,
          $Res Function(_$UserRegistrationInitialImpl) then) =
      __$$UserRegistrationInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegistrationData data});

  $UserRegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserRegistrationInitialImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationInitialImpl>
    implements _$$UserRegistrationInitialImplCopyWith<$Res> {
  __$$UserRegistrationInitialImplCopyWithImpl(
      _$UserRegistrationInitialImpl _value,
      $Res Function(_$UserRegistrationInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserRegistrationInitialImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRegistrationData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRegistrationDataCopyWith<$Res> get data {
    return $UserRegistrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$UserRegistrationInitialImpl implements UserRegistrationInitial {
  const _$UserRegistrationInitialImpl(this.data);

  @override
  final UserRegistrationData data;

  @override
  String toString() {
    return 'UserRegistrationState.initial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationInitialImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationInitialImplCopyWith<_$UserRegistrationInitialImpl>
      get copyWith => __$$UserRegistrationInitialImplCopyWithImpl<
          _$UserRegistrationInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserRegistrationInitial implements UserRegistrationState {
  const factory UserRegistrationInitial(final UserRegistrationData data) =
      _$UserRegistrationInitialImpl;

  UserRegistrationData get data;
  @JsonKey(ignore: true)
  _$$UserRegistrationInitialImplCopyWith<_$UserRegistrationInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRegistrationDataLoadedImplCopyWith<$Res> {
  factory _$$UserRegistrationDataLoadedImplCopyWith(
          _$UserRegistrationDataLoadedImpl value,
          $Res Function(_$UserRegistrationDataLoadedImpl) then) =
      __$$UserRegistrationDataLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegistrationData data});

  $UserRegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserRegistrationDataLoadedImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationDataLoadedImpl>
    implements _$$UserRegistrationDataLoadedImplCopyWith<$Res> {
  __$$UserRegistrationDataLoadedImplCopyWithImpl(
      _$UserRegistrationDataLoadedImpl _value,
      $Res Function(_$UserRegistrationDataLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserRegistrationDataLoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRegistrationData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRegistrationDataCopyWith<$Res> get data {
    return $UserRegistrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$UserRegistrationDataLoadedImpl implements UserRegistrationDataLoaded {
  const _$UserRegistrationDataLoadedImpl(this.data);

  @override
  final UserRegistrationData data;

  @override
  String toString() {
    return 'UserRegistrationState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationDataLoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationDataLoadedImplCopyWith<_$UserRegistrationDataLoadedImpl>
      get copyWith => __$$UserRegistrationDataLoadedImplCopyWithImpl<
          _$UserRegistrationDataLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserRegistrationDataLoaded implements UserRegistrationState {
  const factory UserRegistrationDataLoaded(final UserRegistrationData data) =
      _$UserRegistrationDataLoadedImpl;

  UserRegistrationData get data;
  @JsonKey(ignore: true)
  _$$UserRegistrationDataLoadedImplCopyWith<_$UserRegistrationDataLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRegistrationLoadingImplCopyWith<$Res> {
  factory _$$UserRegistrationLoadingImplCopyWith(
          _$UserRegistrationLoadingImpl value,
          $Res Function(_$UserRegistrationLoadingImpl) then) =
      __$$UserRegistrationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserRegistrationLoadingImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationLoadingImpl>
    implements _$$UserRegistrationLoadingImplCopyWith<$Res> {
  __$$UserRegistrationLoadingImplCopyWithImpl(
      _$UserRegistrationLoadingImpl _value,
      $Res Function(_$UserRegistrationLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserRegistrationLoadingImpl implements UserRegistrationLoading {
  const _$UserRegistrationLoadingImpl();

  @override
  String toString() {
    return 'UserRegistrationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserRegistrationLoading implements UserRegistrationState {
  const factory UserRegistrationLoading() = _$UserRegistrationLoadingImpl;
}

/// @nodoc
abstract class _$$UserRegistrationSuccessImplCopyWith<$Res> {
  factory _$$UserRegistrationSuccessImplCopyWith(
          _$UserRegistrationSuccessImpl value,
          $Res Function(_$UserRegistrationSuccessImpl) then) =
      __$$UserRegistrationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegistrationData data});

  $UserRegistrationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserRegistrationSuccessImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationSuccessImpl>
    implements _$$UserRegistrationSuccessImplCopyWith<$Res> {
  __$$UserRegistrationSuccessImplCopyWithImpl(
      _$UserRegistrationSuccessImpl _value,
      $Res Function(_$UserRegistrationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserRegistrationSuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserRegistrationData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRegistrationDataCopyWith<$Res> get data {
    return $UserRegistrationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$UserRegistrationSuccessImpl implements UserRegistrationSuccess {
  const _$UserRegistrationSuccessImpl(this.data);

  @override
  final UserRegistrationData data;

  @override
  String toString() {
    return 'UserRegistrationState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationSuccessImplCopyWith<_$UserRegistrationSuccessImpl>
      get copyWith => __$$UserRegistrationSuccessImplCopyWithImpl<
          _$UserRegistrationSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UserRegistrationSuccess implements UserRegistrationState {
  const factory UserRegistrationSuccess(final UserRegistrationData data) =
      _$UserRegistrationSuccessImpl;

  UserRegistrationData get data;
  @JsonKey(ignore: true)
  _$$UserRegistrationSuccessImplCopyWith<_$UserRegistrationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRegistrationFailureImplCopyWith<$Res> {
  factory _$$UserRegistrationFailureImplCopyWith(
          _$UserRegistrationFailureImpl value,
          $Res Function(_$UserRegistrationFailureImpl) then) =
      __$$UserRegistrationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserRegistrationFailureImplCopyWithImpl<$Res>
    extends _$UserRegistrationStateCopyWithImpl<$Res,
        _$UserRegistrationFailureImpl>
    implements _$$UserRegistrationFailureImplCopyWith<$Res> {
  __$$UserRegistrationFailureImplCopyWithImpl(
      _$UserRegistrationFailureImpl _value,
      $Res Function(_$UserRegistrationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserRegistrationFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRegistrationFailureImpl implements UserRegistrationFailure {
  const _$UserRegistrationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserRegistrationState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationFailureImplCopyWith<_$UserRegistrationFailureImpl>
      get copyWith => __$$UserRegistrationFailureImplCopyWithImpl<
          _$UserRegistrationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRegistrationData data) initial,
    required TResult Function(UserRegistrationData data) loaded,
    required TResult Function() loading,
    required TResult Function(UserRegistrationData data) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationData data)? initial,
    TResult? Function(UserRegistrationData data)? loaded,
    TResult? Function()? loading,
    TResult? Function(UserRegistrationData data)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRegistrationData data)? initial,
    TResult Function(UserRegistrationData data)? loaded,
    TResult Function()? loading,
    TResult Function(UserRegistrationData data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserRegistrationInitial value) initial,
    required TResult Function(UserRegistrationDataLoaded value) loaded,
    required TResult Function(UserRegistrationLoading value) loading,
    required TResult Function(UserRegistrationSuccess value) success,
    required TResult Function(UserRegistrationFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserRegistrationInitial value)? initial,
    TResult? Function(UserRegistrationDataLoaded value)? loaded,
    TResult? Function(UserRegistrationLoading value)? loading,
    TResult? Function(UserRegistrationSuccess value)? success,
    TResult? Function(UserRegistrationFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserRegistrationInitial value)? initial,
    TResult Function(UserRegistrationDataLoaded value)? loaded,
    TResult Function(UserRegistrationLoading value)? loading,
    TResult Function(UserRegistrationSuccess value)? success,
    TResult Function(UserRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UserRegistrationFailure implements UserRegistrationState {
  const factory UserRegistrationFailure(final String message) =
      _$UserRegistrationFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UserRegistrationFailureImplCopyWith<_$UserRegistrationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
