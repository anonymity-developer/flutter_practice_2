import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';

/// UserRegistrationCubit: 유저 등록 정보 관리
class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  final UserRegistrationRepository userRegistrationRepository;

  UserRegistrationCubit(this.userRegistrationRepository)
      : super(UserRegistrationInitial(const UserRegistrationData()));

  /// 닉네임 저장
  void saveNickname(String nickname) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(nickname: nickname);
    emit(UserRegistrationDataLoaded(updatedData));
  }

  /// 생일 저장
  void saveBirthday(String birthday) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(birthday: birthday);
    emit(UserRegistrationDataLoaded(updatedData));
  }

  /// 성별 저장
  void saveGender(String gender) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(gender: gender);
    emit(UserRegistrationDataLoaded(updatedData));
  }

  /// 추천코드 저장
  void saveReferralCode(String? referralCode) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(referralCode: referralCode);
    emit(UserRegistrationDataLoaded(updatedData));
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
    emit(UserRegistrationDataLoaded(updatedData));
  }

  /// 유저 등록 정보 초기화
  void clearUserRegistrationData() {
    emit(UserRegistrationInitial(const UserRegistrationData()));
  }

  /// 현재 State에서 UserRegistrationData 가져오기
  UserRegistrationData _getCurrentData() {
    if (state is UserRegistrationInitial) {
      return (state as UserRegistrationInitial).data;
    } else if (state is UserRegistrationDataLoaded) {
      return (state as UserRegistrationDataLoaded).data;
    } else if (state is UserRegistrationDataSaved) {
      return (state as UserRegistrationDataSaved).data;
    }
    return const UserRegistrationData();
  }
}

/// UserRegistrationState: 유저 등록 상태
abstract class UserRegistrationState {}

/// 초기 상태 (빈 UserRegistrationData)
class UserRegistrationInitial extends UserRegistrationState {
  final UserRegistrationData data;

  UserRegistrationInitial(this.data);
}

/// 로딩 중
class UserRegistrationLoading extends UserRegistrationState {}

/// 유저 등록 정보 로드 완료
class UserRegistrationDataLoaded extends UserRegistrationState {
  final UserRegistrationData data;

  UserRegistrationDataLoaded(this.data);
}

/// 유저 등록 정보 저장 완료
class UserRegistrationDataSaved extends UserRegistrationState {
  final UserRegistrationData data;

  UserRegistrationDataSaved(this.data);
}
