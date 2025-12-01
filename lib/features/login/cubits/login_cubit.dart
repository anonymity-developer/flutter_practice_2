import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/login_repository.dart';
import '../models.dart';
import '../../user_registration/repository/user_registration_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_cubit.freezed.dart';

/// LoginCubit: 로그인 상태 관리
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final UserRegistrationRepository userRegistrationRepository;

  LoginCubit(this.loginRepository, this.userRegistrationRepository)
    : super(const LoginState());

  /// 로그인 처리 (목데이터 체크)
  Future<void> login(String userId, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = await loginRepository.login(userId, password);
      if (user != null) {
        // 유저 등록 여부 확인
        try {
          final registrationData = await userRegistrationRepository
              .getUserByUserId(userId);
          final isRegistered = registrationData != null;

          emit(
            state.copyWith(
              isLoading: false,
              user: user,
              loginUserId: userId, // 로그인 ID 저장
              isRegistered: isRegistered,
              error: null,
            ),
          );
        } catch (e) {
          // 등록 정보 조회 실패 시에도 로그인은 성공으로 처리
          emit(
            state.copyWith(
              isLoading: false,
              user: user,
              loginUserId: userId, // 로그인 ID 저장
              isRegistered: false,
              error: null,
            ),
          );
        }
      } else {
        emit(
          state.copyWith(isLoading: false, error: '아이디 또는 비밀번호가 올바르지 않습니다.'),
        );
      }
    } catch (e) {
      print('로그인 전체 실패: $e');
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// 사용자 정보 삭제 (로그아웃)
  Future<void> logout() async {
    emit(state.copyWith(user: null, loginUserId: null, isRegistered: false));
  }
}

// [*] Sealed class 비활성화
// /// LoginState: 로그인 상태
// sealed class LoginState {}
// /// 초기 상태
// final class LoginInitial extends LoginState {}
// /// 로딩 중 상태
// final class LoginLoading extends LoginState {}
// /// 성공 상태 (사용자 정보 포함)
// final class LoginSuccess extends LoginState {
//   final User user;
//   final bool isRegistered; // 유저 등록 여부
//   LoginSuccess(this.user, {this.isRegistered = false});
// }
// /// 실패 상태 (에러 메시지 포함)
// final class LoginFailure extends LoginState {
//   final String message;
//   LoginFailure(this.message);
// }

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    User? user,
    String? loginUserId, // 로그인에 사용한 ID
    @Default(false) bool isRegistered,
    String? error,
  }) = _LoginState;
}

// Cubit 클래스 (상태 관리자)
// 1. 생성자: 초기 상태 설정
// 2. 메서드: 상태 변경 (상태 변경 시 emit 호출 -> 상태 변경을 알려 UI 업데이트 시킴)

// State 클래스 (상태 종류)
// 상태에는 여러 종류가 있을 수 있음
// abstract으로 부모 클래스 생성, extend 하여 사용

// main에서 주입
// 상태 변경(액션) -> UI쪽에서 cubit method 호출하여 사용
// 상태 감지(리액션) -> 상태가 변경되면 listener가 실행되어 화면 이동 등을 처리
// 상태 표시(UI 업데이트) -> 상태가 변경되면 builder가 실행되어 UI 업데이트

// emit() = 상태 변경 알림 → 이걸 하면 BlocListener, BlocBuilder가 자동으로 반응
// context.read<LoginCubit>() = Cubit 가져오기 → 주입된 Cubit 인스턴스를 가져와 메서드를 호출
// state = 현재 상태
