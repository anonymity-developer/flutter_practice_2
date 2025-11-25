import 'package:equatable/equatable.dart';

/// 회원가입 정보 모델
class SignupData extends Equatable {
  final String? nickname;
  final String? birthday;
  final String? gender;
  final String? referralCode;
  final bool serviceTerms;
  final bool privacyPolicy;
  final bool locationInfo;
  final bool marketingInfo;

  const SignupData({
    this.nickname,
    this.birthday,
    this.gender,
    this.referralCode,
    this.serviceTerms = false,
    this.privacyPolicy = false,
    this.locationInfo = false,
    this.marketingInfo = false,
  });

  /// 불변성을 유지하면서 특정 필드만 업데이트
  SignupData copyWith({
    String? nickname,
    String? birthday,
    String? gender,
    String? referralCode,
    bool? serviceTerms,
    bool? privacyPolicy,
    bool? locationInfo,
    bool? marketingInfo,
  }) {
    return SignupData(
      nickname: nickname ?? this.nickname,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      referralCode: referralCode ?? this.referralCode,
      serviceTerms: serviceTerms ?? this.serviceTerms,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      locationInfo: locationInfo ?? this.locationInfo,
      marketingInfo: marketingInfo ?? this.marketingInfo,
    );
  }

  /// JSON에서 SignupData로 변환
  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
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

  /// SignupData를 JSON으로 변환
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

  @override
  List<Object?> get props => [
        nickname,
        birthday,
        gender,
        referralCode,
        serviceTerms,
        privacyPolicy,
        locationInfo,
        marketingInfo,
      ];
}

