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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetRegistrationStateCopyWith<$Res> {
  factory $PetRegistrationStateCopyWith(PetRegistrationState value,
          $Res Function(PetRegistrationState) then) =
      _$PetRegistrationStateCopyWithImpl<$Res, PetRegistrationState>;
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
}

/// @nodoc
abstract class _$$PetRegistrationInitialImplCopyWith<$Res> {
  factory _$$PetRegistrationInitialImplCopyWith(
          _$PetRegistrationInitialImpl value,
          $Res Function(_$PetRegistrationInitialImpl) then) =
      __$$PetRegistrationInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Pet pet});
}

/// @nodoc
class __$$PetRegistrationInitialImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res,
        _$PetRegistrationInitialImpl>
    implements _$$PetRegistrationInitialImplCopyWith<$Res> {
  __$$PetRegistrationInitialImplCopyWithImpl(
      _$PetRegistrationInitialImpl _value,
      $Res Function(_$PetRegistrationInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = null,
  }) {
    return _then(_$PetRegistrationInitialImpl(
      null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet,
    ));
  }
}

/// @nodoc

class _$PetRegistrationInitialImpl implements PetRegistrationInitial {
  const _$PetRegistrationInitialImpl(this.pet);

  @override
  final Pet pet;

  @override
  String toString() {
    return 'PetRegistrationState.initial(pet: $pet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationInitialImpl &&
            (identical(other.pet, pet) || other.pet == pet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetRegistrationInitialImplCopyWith<_$PetRegistrationInitialImpl>
      get copyWith => __$$PetRegistrationInitialImplCopyWithImpl<
          _$PetRegistrationInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) {
    return initial(pet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call(pet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PetRegistrationInitial implements PetRegistrationState {
  const factory PetRegistrationInitial(final Pet pet) =
      _$PetRegistrationInitialImpl;

  Pet get pet;
  @JsonKey(ignore: true)
  _$$PetRegistrationInitialImplCopyWith<_$PetRegistrationInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PetRegistrationLoadedImplCopyWith<$Res> {
  factory _$$PetRegistrationLoadedImplCopyWith(
          _$PetRegistrationLoadedImpl value,
          $Res Function(_$PetRegistrationLoadedImpl) then) =
      __$$PetRegistrationLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Pet pet});
}

/// @nodoc
class __$$PetRegistrationLoadedImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res,
        _$PetRegistrationLoadedImpl>
    implements _$$PetRegistrationLoadedImplCopyWith<$Res> {
  __$$PetRegistrationLoadedImplCopyWithImpl(_$PetRegistrationLoadedImpl _value,
      $Res Function(_$PetRegistrationLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = null,
  }) {
    return _then(_$PetRegistrationLoadedImpl(
      null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet,
    ));
  }
}

/// @nodoc

class _$PetRegistrationLoadedImpl implements PetRegistrationLoaded {
  const _$PetRegistrationLoadedImpl(this.pet);

  @override
  final Pet pet;

  @override
  String toString() {
    return 'PetRegistrationState.loaded(pet: $pet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationLoadedImpl &&
            (identical(other.pet, pet) || other.pet == pet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetRegistrationLoadedImplCopyWith<_$PetRegistrationLoadedImpl>
      get copyWith => __$$PetRegistrationLoadedImplCopyWithImpl<
          _$PetRegistrationLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(pet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(pet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PetRegistrationLoaded implements PetRegistrationState {
  const factory PetRegistrationLoaded(final Pet pet) =
      _$PetRegistrationLoadedImpl;

  Pet get pet;
  @JsonKey(ignore: true)
  _$$PetRegistrationLoadedImplCopyWith<_$PetRegistrationLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PetRegistrationLoadingImplCopyWith<$Res> {
  factory _$$PetRegistrationLoadingImplCopyWith(
          _$PetRegistrationLoadingImpl value,
          $Res Function(_$PetRegistrationLoadingImpl) then) =
      __$$PetRegistrationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PetRegistrationLoadingImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res,
        _$PetRegistrationLoadingImpl>
    implements _$$PetRegistrationLoadingImplCopyWith<$Res> {
  __$$PetRegistrationLoadingImplCopyWithImpl(
      _$PetRegistrationLoadingImpl _value,
      $Res Function(_$PetRegistrationLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PetRegistrationLoadingImpl implements PetRegistrationLoading {
  const _$PetRegistrationLoadingImpl();

  @override
  String toString() {
    return 'PetRegistrationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
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
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PetRegistrationLoading implements PetRegistrationState {
  const factory PetRegistrationLoading() = _$PetRegistrationLoadingImpl;
}

/// @nodoc
abstract class _$$PetRegistrationSuccessImplCopyWith<$Res> {
  factory _$$PetRegistrationSuccessImplCopyWith(
          _$PetRegistrationSuccessImpl value,
          $Res Function(_$PetRegistrationSuccessImpl) then) =
      __$$PetRegistrationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Pet pet});
}

/// @nodoc
class __$$PetRegistrationSuccessImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res,
        _$PetRegistrationSuccessImpl>
    implements _$$PetRegistrationSuccessImplCopyWith<$Res> {
  __$$PetRegistrationSuccessImplCopyWithImpl(
      _$PetRegistrationSuccessImpl _value,
      $Res Function(_$PetRegistrationSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pet = null,
  }) {
    return _then(_$PetRegistrationSuccessImpl(
      null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as Pet,
    ));
  }
}

/// @nodoc

class _$PetRegistrationSuccessImpl implements PetRegistrationSuccess {
  const _$PetRegistrationSuccessImpl(this.pet);

  @override
  final Pet pet;

  @override
  String toString() {
    return 'PetRegistrationState.success(pet: $pet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationSuccessImpl &&
            (identical(other.pet, pet) || other.pet == pet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetRegistrationSuccessImplCopyWith<_$PetRegistrationSuccessImpl>
      get copyWith => __$$PetRegistrationSuccessImplCopyWithImpl<
          _$PetRegistrationSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) {
    return success(pet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(pet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(pet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PetRegistrationSuccess implements PetRegistrationState {
  const factory PetRegistrationSuccess(final Pet pet) =
      _$PetRegistrationSuccessImpl;

  Pet get pet;
  @JsonKey(ignore: true)
  _$$PetRegistrationSuccessImplCopyWith<_$PetRegistrationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PetRegistrationFailureImplCopyWith<$Res> {
  factory _$$PetRegistrationFailureImplCopyWith(
          _$PetRegistrationFailureImpl value,
          $Res Function(_$PetRegistrationFailureImpl) then) =
      __$$PetRegistrationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PetRegistrationFailureImplCopyWithImpl<$Res>
    extends _$PetRegistrationStateCopyWithImpl<$Res,
        _$PetRegistrationFailureImpl>
    implements _$$PetRegistrationFailureImplCopyWith<$Res> {
  __$$PetRegistrationFailureImplCopyWithImpl(
      _$PetRegistrationFailureImpl _value,
      $Res Function(_$PetRegistrationFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PetRegistrationFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PetRegistrationFailureImpl implements PetRegistrationFailure {
  const _$PetRegistrationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PetRegistrationState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetRegistrationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetRegistrationFailureImplCopyWith<_$PetRegistrationFailureImpl>
      get copyWith => __$$PetRegistrationFailureImplCopyWithImpl<
          _$PetRegistrationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pet pet) initial,
    required TResult Function(Pet pet) loaded,
    required TResult Function() loading,
    required TResult Function(Pet pet) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Pet pet)? initial,
    TResult? Function(Pet pet)? loaded,
    TResult? Function()? loading,
    TResult? Function(Pet pet)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pet pet)? initial,
    TResult Function(Pet pet)? loaded,
    TResult Function()? loading,
    TResult Function(Pet pet)? success,
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
    required TResult Function(PetRegistrationInitial value) initial,
    required TResult Function(PetRegistrationLoaded value) loaded,
    required TResult Function(PetRegistrationLoading value) loading,
    required TResult Function(PetRegistrationSuccess value) success,
    required TResult Function(PetRegistrationFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PetRegistrationInitial value)? initial,
    TResult? Function(PetRegistrationLoaded value)? loaded,
    TResult? Function(PetRegistrationLoading value)? loading,
    TResult? Function(PetRegistrationSuccess value)? success,
    TResult? Function(PetRegistrationFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PetRegistrationInitial value)? initial,
    TResult Function(PetRegistrationLoaded value)? loaded,
    TResult Function(PetRegistrationLoading value)? loading,
    TResult Function(PetRegistrationSuccess value)? success,
    TResult Function(PetRegistrationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PetRegistrationFailure implements PetRegistrationState {
  const factory PetRegistrationFailure(final String message) =
      _$PetRegistrationFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$PetRegistrationFailureImplCopyWith<_$PetRegistrationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
