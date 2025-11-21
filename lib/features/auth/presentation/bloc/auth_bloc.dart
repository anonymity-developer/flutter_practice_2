import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// BLoC: 비즈니스 로직과 UI 상태를 연결
/// - Event를 받아서 Repository를 통해 데이터 처리
/// - 처리 결과를 State로 변환하여 UI에 전달
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoadSavedUser>(_onLoadSavedUser);
    on<ClearUser>(_onClearUser);
  }

  /// 회원가입 처리
  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signUp(
        email: event.email,
        password: event.password,
        name: event.name,
        phone: event.phone,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// 저장된 사용자 정보 로드
  Future<void> _onLoadSavedUser(
    LoadSavedUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.getSavedUser();
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// 사용자 정보 삭제
  Future<void> _onClearUser(
    ClearUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepository.clearUser();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

