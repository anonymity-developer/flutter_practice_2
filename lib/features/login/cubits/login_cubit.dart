import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/login_repository.dart';
import '../models.dart';
import '../../user_registration/repository/user_registration_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';

/// LoginCubit: 로그인 상태 관리
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final UserRegistrationRepository userRegistrationRepository;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  LoginCubit(this.loginRepository, this.userRegistrationRepository)
    : super(const LoginState());

  /// 로그인 처리
  /// isAutoLoginEnabled = false 기본값, 전달 받은 게 있으면 그걸로 처리
  Future<void> login(String userId, String password, {bool isAutoLoginEnabled = false}) async { 
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = await loginRepository.login(userId, password);
      if (user != null) {
        // 자동 로그인 설정에 따라 저장
        if (isAutoLoginEnabled) {
          await _saveLoginCredentials(userId, password);
        } else {
          await _clearLoginCredentials();
        }

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
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// 로그인 정보 저장
  Future<void> _saveLoginCredentials(String userId, String password) async {
  
    // flutter_secure_storage에 저장
    await _secureStorage.write(key: 'userId', value: userId);
    await _secureStorage.write(key: 'password', value: password);
    
    // shared_preferences에 설정 저장
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAutoLoginEnabled', true);
    await prefs.setString('lastLoginTime', DateTime.now().toIso8601String());
  }

  /// 로그인 정보 삭제
  Future<void> _clearLoginCredentials() async {
    await _secureStorage.delete(key: 'userId');
    await _secureStorage.delete(key: 'password');
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAutoLoginEnabled', false);
  }

  /// 사용자 정보 삭제 (로그아웃)
  Future<void> logout() async {
    await _clearLoginCredentials(); // 로그아웃 시 저장된 정보 삭제
    emit(state.copyWith(user: null, loginUserId: null, isRegistered: false));
  }

  /// 앱 시작 시 자동 로그인 확인
  Future<void> checkAutoLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isAutoLoginEnabled = prefs.getBool('isAutoLoginEnabled') ?? false;
      
      if (!isAutoLoginEnabled) {
        return; // 자동 로그인 비활성화 상태면 종료
      }
      
      // 저장된 자격 증명 가져오기
      final userId = await _secureStorage.read(key: 'userId');
      final password = await _secureStorage.read(key: 'password');
      
      if (userId != null && password != null) {
        // 자동 로그인 시도
        await login(userId, password, isAutoLoginEnabled: true);
      }
    } catch (e) {
      print('자동 로그인 확인 실패: $e');
      // 에러 발생 시 자동 로그인 정보 삭제
      await _clearLoginCredentials();
    }
  }
}

@freezed // flag-based 방식
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