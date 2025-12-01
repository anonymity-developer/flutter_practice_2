import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_cubit.freezed.dart';

/// UserRegistrationCubit: 유저 등록 정보 관리
class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  final UserRegistrationRepository userRegistrationRepository;

  UserRegistrationCubit(this.userRegistrationRepository)
      : super(const UserRegistrationState());

  /// 닉네임 저장
  void saveNickname(String nickname) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(nickname: nickname);
    emit(state.copyWith(data: updatedData, isLoading: false, error: null));
  }

  /// 생일 저장
  void saveBirthday(String birthday) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(birthday: birthday);
    emit(state.copyWith(data: updatedData, isLoading: false, error: null));
  }

  /// 성별 저장
  void saveGender(UserGender gender) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(gender: gender);
    emit(state.copyWith(data: updatedData, isLoading: false, error: null));
  }

  /// 추천코드 저장
  void saveReferralCode(String? referralCode) {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(referralCode: referralCode);
    emit(state.copyWith(data: updatedData, isLoading: false, error: null));
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
    emit(state.copyWith(data: updatedData, isLoading: false, error: null));
  }

  /// 유저 등록 정보 초기화
  void clearUserRegistrationData() {
    emit(const UserRegistrationState());
  }

  /// 유저 등록 완료 (Repo에 저장)
Future<void> completeUserRegistration(String userId) async {
  final currentData = _getCurrentData();

  final hasRequiredData = currentData.nickname != null &&
      currentData.nickname!.isNotEmpty &&
      currentData.birthday != null &&
      currentData.birthday!.isNotEmpty &&
      currentData.gender != null &&
      currentData.serviceTerms &&
      currentData.privacyPolicy;

  if (hasRequiredData) {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await userRegistrationRepository.registerUser(userId, currentData);
      emit(state.copyWith(data: currentData, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  } else {
    emit(state.copyWith(isLoading: false, error: '필수 정보를 모두 입력해주세요.'));
  }
}
  /// 현재 State에서 UserRegistrationData 가져오기
  UserRegistrationData _getCurrentData() {
    return state.data;
  }
}

@freezed // flag-based 방식
class UserRegistrationState with _$UserRegistrationState {
  const factory UserRegistrationState({
    @Default(UserRegistrationData()) UserRegistrationData data,
    @Default(false) bool isLoading,
    String? error,
  }) = _UserRegistrationState;
}