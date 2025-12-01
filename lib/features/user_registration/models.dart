import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

enum UserGender {
  male,
  female;
}

/// gender JSON 변환기 -> 기본값 처리, nullable enum 처리를 위해 사용
class UserGenderConverter implements JsonConverter<UserGender?, String?> {
  const UserGenderConverter();
  @override
  UserGender? fromJson(String? json) {
    if (json == null) return null;
    return UserGender.values.firstWhere(
      (e) => e.name == json,
      orElse: () => UserGender.male,
    );
  }
  @override
  String? toJson(UserGender? object) => object?.name;
}

/// 유저 등록 정보 모델
@freezed
class UserRegistrationData with _$UserRegistrationData {
  const factory UserRegistrationData({
    String? nickname,
    String? birthday,
    @UserGenderConverter() UserGender? gender,
    String? referralCode,
    @Default(false) bool serviceTerms,
    @Default(false) bool privacyPolicy,
    @Default(false) bool locationInfo,
    @Default(false) bool marketingInfo,
  }) = _UserRegistrationData;

  factory UserRegistrationData.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationDataFromJson(json);
}



