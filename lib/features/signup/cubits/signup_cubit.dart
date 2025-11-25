import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/signup_repository.dart';
import '../models.dart';

/// SignupCubit: 회원가입 정보 관리
class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;

  SignupCubit(this.signupRepository) : super(SignupInitial(const SignupData()));

  /// 닉네임 저장
  void saveNickname(String nickname) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(nickname: nickname);
    emit(SignupDataLoaded(updatedData));
  }

  /// 생일 저장
  void saveBirthday(String birthday) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(birthday: birthday);
    emit(SignupDataLoaded(updatedData));
  }

  /// 성별 저장
  void saveGender(String gender) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(gender: gender);
    emit(SignupDataLoaded(updatedData));
  }

  /// 추천코드 저장
  void saveReferralCode(String? referralCode) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(referralCode: referralCode);
    emit(SignupDataLoaded(updatedData));
  }

  /// 약관 동의 저장
  void saveTermsAgreement({
    required bool serviceTerms,
    required bool privacyPolicy,
    required bool locationInfo,
    required bool marketingInfo,
  }) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(
      serviceTerms: serviceTerms,
      privacyPolicy: privacyPolicy,
      locationInfo: locationInfo,
      marketingInfo: marketingInfo,
    );
    emit(SignupDataLoaded(updatedData));
  }

  /// 회원가입 정보 초기화
  void clearSignupData() {
    emit(SignupInitial(const SignupData()));
  }

  /// 현재 State에서 SignupData 가져오기
  SignupData _getCurrentData() {
    if (state is SignupInitial) {
      return (state as SignupInitial).data;
    } else if (state is SignupDataLoaded) {
      return (state as SignupDataLoaded).data;
    } else if (state is SignupDataSaved) {
      return (state as SignupDataSaved).data;
    }
    return const SignupData();
  }
}

/// SignupState: 회원가입 상태
abstract class SignupState {}

/// 초기 상태 (빈 SignupData)
class SignupInitial extends SignupState {
  final SignupData data;

  SignupInitial(this.data);
}

/// 로딩 중
class SignupLoading extends SignupState {}

/// 회원가입 정보 로드 완료
class SignupDataLoaded extends SignupState {
  final SignupData data;

  SignupDataLoaded(this.data);
}

/// 회원가입 정보 저장 완료
class SignupDataSaved extends SignupState {
  final SignupData data;

  SignupDataSaved(this.data);
}
