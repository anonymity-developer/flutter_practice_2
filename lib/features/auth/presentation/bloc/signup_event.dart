import 'package:equatable/equatable.dart';

/// 회원가입 정보 관리 BLoC Event
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

/// 닉네임 저장
class SaveNickname extends SignupEvent {
  final String nickname;

  const SaveNickname(this.nickname);

  @override
  List<Object?> get props => [nickname];
}

/// 생일 저장
class SaveBirthday extends SignupEvent {
  final String birthday;

  const SaveBirthday(this.birthday);

  @override
  List<Object?> get props => [birthday];
}

/// 성별 저장
class SaveGender extends SignupEvent {
  final String gender;

  const SaveGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

/// 추천코드 저장
class SaveReferralCode extends SignupEvent {
  final String? referralCode;

  const SaveReferralCode(this.referralCode);

  @override
  List<Object?> get props => [referralCode];
}

/// 약관 동의 저장
class SaveTermsAgreement extends SignupEvent {
  final bool serviceTerms;
  final bool privacyPolicy;
  final bool locationInfo;
  final bool marketingInfo;

  const SaveTermsAgreement({
    required this.serviceTerms,
    required this.privacyPolicy,
    required this.locationInfo,
    required this.marketingInfo,
  });

  @override
  List<Object?> get props => [serviceTerms, privacyPolicy, locationInfo, marketingInfo];
}

/// 저장된 회원가입 정보 로드
class LoadSignupData extends SignupEvent {
  const LoadSignupData();
}

/// 회원가입 정보 초기화
class ClearSignupData extends SignupEvent {
  const ClearSignupData();
}

