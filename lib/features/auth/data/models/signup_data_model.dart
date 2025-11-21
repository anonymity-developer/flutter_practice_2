import '../../domain/entities/signup_data.dart';

/// SignupData Model: JSON 직렬화/역직렬화 담당
class SignupDataModel extends SignupData {
  const SignupDataModel({
    super.nickname,
    super.birthday,
    super.gender,
    super.referralCode,
    super.serviceTerms,
    super.privacyPolicy,
    super.locationInfo,
    super.marketingInfo,
  });

  /// JSON에서 Model로 변환
  factory SignupDataModel.fromJson(Map<String, dynamic> json) {
    return SignupDataModel(
      nickname: json['nickname'] as String?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      referralCode: json['referralCode'] as String?,
      serviceTerms: json['serviceTerms'] as bool? ?? false,
      privacyPolicy: json['privacyPolicy'] as bool? ?? false,
      locationInfo: json['locationInfo'] as bool? ?? false,
      marketingInfo: json['marketingInfo'] as bool? ?? false,
    );
  }

  /// Model을 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'birthday': birthday,
      'gender': gender,
      'referralCode': referralCode,
      'serviceTerms': serviceTerms,
      'privacyPolicy': privacyPolicy,
      'locationInfo': locationInfo,
      'marketingInfo': marketingInfo,
    };
  }

  /// Entity에서 Model로 변환
  factory SignupDataModel.fromEntity(SignupData entity) {
    return SignupDataModel(
      nickname: entity.nickname,
      birthday: entity.birthday,
      gender: entity.gender,
      referralCode: entity.referralCode,
      serviceTerms: entity.serviceTerms,
      privacyPolicy: entity.privacyPolicy,
      locationInfo: entity.locationInfo,
      marketingInfo: entity.marketingInfo,
    );
  }

  /// Model을 Entity로 변환
  SignupData toEntity() {
    return SignupData(
      nickname: nickname,
      birthday: birthday,
      gender: gender,
      referralCode: referralCode,
      serviceTerms: serviceTerms,
      privacyPolicy: privacyPolicy,
      locationInfo: locationInfo,
      marketingInfo: marketingInfo,
    );
  }
}

