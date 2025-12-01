import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_cubit.freezed.dart';

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

  /// 유저 등록 완료 (Repo에 저장)
Future<void> completeUserRegistration(String userId) async {
  final currentData = _getCurrentData();

  final hasRequiredData = currentData.nickname != null &&
      currentData.nickname!.isNotEmpty &&
      currentData.birthday != null &&
      currentData.birthday!.isNotEmpty &&
      currentData.gender != null &&
      currentData.gender!.isNotEmpty &&
      currentData.serviceTerms &&
      currentData.privacyPolicy;

  if (hasRequiredData) {
    emit(UserRegistrationLoading());
    try {
      await userRegistrationRepository.registerUser(userId, currentData);
      emit(UserRegistrationSuccess(currentData));
    } catch (e) {
      emit(UserRegistrationFailure(e.toString()));
    }
  } else {
    emit(UserRegistrationFailure('필수 정보를 모두 입력해주세요.'));
  }
}
  /// 현재 State에서 UserRegistrationData 가져오기
  UserRegistrationData _getCurrentData() {
    return switch (state) {
      UserRegistrationInitial(data: final data) => data,
      UserRegistrationDataLoaded(data: final data) => data,
      UserRegistrationLoading() => const UserRegistrationData(),
      UserRegistrationSuccess(data: final data) => data,
      UserRegistrationFailure(message: _) => const UserRegistrationData(),
      _ => const UserRegistrationData(), // 와일드카드 패턴
    };
  }
}

// [*] Sealed class 비활성화
// /// UserRegistrationState: 유저 등록 상태
// sealed class UserRegistrationState {}
// /// 초기 상태 (빈 UserRegistrationData)
// final class UserRegistrationInitial extends UserRegistrationState {
//   final UserRegistrationData data;
//   UserRegistrationInitial(this.data);
// }
// /// 로딩 중
// final class UserRegistrationLoading extends UserRegistrationState {}
// /// 유저 등록 정보 로드 완료
// final class UserRegistrationDataLoaded extends UserRegistrationState {
//   final UserRegistrationData data;
//   UserRegistrationDataLoaded(this.data);
// }
// /// 유저 등록 정보 저장 완료
// final class UserRegistrationDataSaved extends UserRegistrationState {
//   final UserRegistrationData data;
//   UserRegistrationDataSaved(this.data);
// }
// /// 유저 등록 실패
// final class UserRegistrationFailure extends UserRegistrationState {
//   final String message;
//   UserRegistrationFailure(this.message);
// }

@freezed // union type 방식 (sealed class와 유사)
class UserRegistrationState with _$UserRegistrationState {
  const factory UserRegistrationState.initial(UserRegistrationData data) = UserRegistrationInitial;
  const factory UserRegistrationState.loaded(UserRegistrationData data) = UserRegistrationDataLoaded;
  const factory UserRegistrationState.loading() = UserRegistrationLoading;
  const factory UserRegistrationState.success(UserRegistrationData data) = UserRegistrationSuccess;
  const factory UserRegistrationState.failure(String message) = UserRegistrationFailure;
}