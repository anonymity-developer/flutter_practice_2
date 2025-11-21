import 'package:equatable/equatable.dart';

/// 회원가입 정보를 담는 Entity
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

