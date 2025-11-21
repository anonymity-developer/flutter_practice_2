import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/signup_data.dart';
import 'signup_event.dart';
import 'signup_state.dart';

/// 회원가입 정보를 관리하는 BLoC
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;

  SignupBloc(this.authRepository)
      : super(SignupInitial(const SignupData())) {
    on<SaveNickname>(_onSaveNickname);
    on<SaveBirthday>(_onSaveBirthday);
    on<SaveGender>(_onSaveGender);
    on<SaveReferralCode>(_onSaveReferralCode);
    on<SaveTermsAgreement>(_onSaveTermsAgreement);
    on<LoadSignupData>(_onLoadSignupData);
    on<ClearSignupData>(_onClearSignupData);
  }

  /// 닉네임 저장
  Future<void> _onSaveNickname(
    SaveNickname event,
    Emitter<SignupState> emit,
  ) async {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(nickname: event.nickname);
    emit(SignupDataLoaded(updatedData));
    await authRepository.saveSignupData(updatedData);
    emit(SignupDataSaved(updatedData));
  }

  /// 생일 저장
  Future<void> _onSaveBirthday(
    SaveBirthday event,
    Emitter<SignupState> emit,
  ) async {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(birthday: event.birthday);
    emit(SignupDataLoaded(updatedData));
    await authRepository.saveSignupData(updatedData);
    emit(SignupDataSaved(updatedData));
  }

  /// 성별 저장
  Future<void> _onSaveGender(
    SaveGender event,
    Emitter<SignupState> emit,
  ) async {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(gender: event.gender);
    emit(SignupDataLoaded(updatedData));
    await authRepository.saveSignupData(updatedData);
    emit(SignupDataSaved(updatedData));
  }

  /// 추천코드 저장
  Future<void> _onSaveReferralCode(
    SaveReferralCode event,
    Emitter<SignupState> emit,
  ) async {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(referralCode: event.referralCode);
    emit(SignupDataLoaded(updatedData));
    await authRepository.saveSignupData(updatedData);
    emit(SignupDataSaved(updatedData));
  }

  /// 약관 동의 저장
  Future<void> _onSaveTermsAgreement(
    SaveTermsAgreement event,
    Emitter<SignupState> emit,
  ) async {
    final currentData = _getCurrentData();
    final updatedData = currentData.copyWith(
      serviceTerms: event.serviceTerms,
      privacyPolicy: event.privacyPolicy,
      locationInfo: event.locationInfo,
      marketingInfo: event.marketingInfo,
    );
    emit(SignupDataLoaded(updatedData));
    await authRepository.saveSignupData(updatedData);
    emit(SignupDataSaved(updatedData));
  }

  /// 저장된 회원가입 정보 로드
  Future<void> _onLoadSignupData(
    LoadSignupData event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      final savedData = await authRepository.getSignupData();
      emit(SignupDataLoaded(savedData ?? const SignupData()));
    } catch (e) {
      emit(SignupInitial(const SignupData()));
    }
  }

  /// 회원가입 정보 초기화
  Future<void> _onClearSignupData(
    ClearSignupData event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      await authRepository.clearSignupData();
      emit(SignupInitial(const SignupData()));
    } catch (e) {
      emit(SignupInitial(const SignupData()));
    }
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

