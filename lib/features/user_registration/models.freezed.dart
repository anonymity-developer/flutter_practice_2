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

UserRegistrationData _$UserRegistrationDataFromJson(Map<String, dynamic> json) {
  return _UserRegistrationData.fromJson(json);
}

/// @nodoc
mixin _$UserRegistrationData {
  String? get nickname => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  @UserGenderConverter()
  UserGender? get gender => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  bool get serviceTerms => throw _privateConstructorUsedError;
  bool get privacyPolicy => throw _privateConstructorUsedError;
  bool get locationInfo => throw _privateConstructorUsedError;
  bool get marketingInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegistrationDataCopyWith<UserRegistrationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationDataCopyWith<$Res> {
  factory $UserRegistrationDataCopyWith(UserRegistrationData value,
          $Res Function(UserRegistrationData) then) =
      _$UserRegistrationDataCopyWithImpl<$Res, UserRegistrationData>;
  @useResult
  $Res call(
      {String? nickname,
      String? birthday,
      @UserGenderConverter() UserGender? gender,
      String? referralCode,
      bool serviceTerms,
      bool privacyPolicy,
      bool locationInfo,
      bool marketingInfo});
}

/// @nodoc
class _$UserRegistrationDataCopyWithImpl<$Res,
        $Val extends UserRegistrationData>
    implements $UserRegistrationDataCopyWith<$Res> {
  _$UserRegistrationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? referralCode = freezed,
    Object? serviceTerms = null,
    Object? privacyPolicy = null,
    Object? locationInfo = null,
    Object? marketingInfo = null,
  }) {
    return _then(_value.copyWith(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceTerms: null == serviceTerms
          ? _value.serviceTerms
          : serviceTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyPolicy: null == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      locationInfo: null == locationInfo
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingInfo: null == marketingInfo
          ? _value.marketingInfo
          : marketingInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegistrationDataImplCopyWith<$Res>
    implements $UserRegistrationDataCopyWith<$Res> {
  factory _$$UserRegistrationDataImplCopyWith(_$UserRegistrationDataImpl value,
          $Res Function(_$UserRegistrationDataImpl) then) =
      __$$UserRegistrationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nickname,
      String? birthday,
      @UserGenderConverter() UserGender? gender,
      String? referralCode,
      bool serviceTerms,
      bool privacyPolicy,
      bool locationInfo,
      bool marketingInfo});
}

/// @nodoc
class __$$UserRegistrationDataImplCopyWithImpl<$Res>
    extends _$UserRegistrationDataCopyWithImpl<$Res, _$UserRegistrationDataImpl>
    implements _$$UserRegistrationDataImplCopyWith<$Res> {
  __$$UserRegistrationDataImplCopyWithImpl(_$UserRegistrationDataImpl _value,
      $Res Function(_$UserRegistrationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? referralCode = freezed,
    Object? serviceTerms = null,
    Object? privacyPolicy = null,
    Object? locationInfo = null,
    Object? marketingInfo = null,
  }) {
    return _then(_$UserRegistrationDataImpl(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as UserGender?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceTerms: null == serviceTerms
          ? _value.serviceTerms
          : serviceTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyPolicy: null == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      locationInfo: null == locationInfo
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingInfo: null == marketingInfo
          ? _value.marketingInfo
          : marketingInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegistrationDataImpl implements _UserRegistrationData {
  const _$UserRegistrationDataImpl(
      {this.nickname,
      this.birthday,
      @UserGenderConverter() this.gender,
      this.referralCode,
      this.serviceTerms = false,
      this.privacyPolicy = false,
      this.locationInfo = false,
      this.marketingInfo = false});

  factory _$UserRegistrationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegistrationDataImplFromJson(json);

  @override
  final String? nickname;
  @override
  final String? birthday;
  @override
  @UserGenderConverter()
  final UserGender? gender;
  @override
  final String? referralCode;
  @override
  @JsonKey()
  final bool serviceTerms;
  @override
  @JsonKey()
  final bool privacyPolicy;
  @override
  @JsonKey()
  final bool locationInfo;
  @override
  @JsonKey()
  final bool marketingInfo;

  @override
  String toString() {
    return 'UserRegistrationData(nickname: $nickname, birthday: $birthday, gender: $gender, referralCode: $referralCode, serviceTerms: $serviceTerms, privacyPolicy: $privacyPolicy, locationInfo: $locationInfo, marketingInfo: $marketingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationDataImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.serviceTerms, serviceTerms) ||
                other.serviceTerms == serviceTerms) &&
            (identical(other.privacyPolicy, privacyPolicy) ||
                other.privacyPolicy == privacyPolicy) &&
            (identical(other.locationInfo, locationInfo) ||
                other.locationInfo == locationInfo) &&
            (identical(other.marketingInfo, marketingInfo) ||
                other.marketingInfo == marketingInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, birthday, gender,
      referralCode, serviceTerms, privacyPolicy, locationInfo, marketingInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationDataImplCopyWith<_$UserRegistrationDataImpl>
      get copyWith =>
          __$$UserRegistrationDataImplCopyWithImpl<_$UserRegistrationDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegistrationDataImplToJson(
      this,
    );
  }
}

abstract class _UserRegistrationData implements UserRegistrationData {
  const factory _UserRegistrationData(
      {final String? nickname,
      final String? birthday,
      @UserGenderConverter() final UserGender? gender,
      final String? referralCode,
      final bool serviceTerms,
      final bool privacyPolicy,
      final bool locationInfo,
      final bool marketingInfo}) = _$UserRegistrationDataImpl;

  factory _UserRegistrationData.fromJson(Map<String, dynamic> json) =
      _$UserRegistrationDataImpl.fromJson;

  @override
  String? get nickname;
  @override
  String? get birthday;
  @override
  @UserGenderConverter()
  UserGender? get gender;
  @override
  String? get referralCode;
  @override
  bool get serviceTerms;
  @override
  bool get privacyPolicy;
  @override
  bool get locationInfo;
  @override
  bool get marketingInfo;
  @override
  @JsonKey(ignore: true)
  _$$UserRegistrationDataImplCopyWith<_$UserRegistrationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
