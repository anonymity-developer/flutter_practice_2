import 'package:equatable/equatable.dart';

/// BLoC Event: UI에서 발생하는 사용자 액션을 나타냄
/// - 버튼 클릭, 폼 제출, 화면 진입 등
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// 회원가입 요청 이벤트
class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String? phone;

  const SignUpRequested({
    required this.email,
    required this.password,
    required this.name,
    this.phone,
  });

  @override
  List<Object?> get props => [email, password, name, phone];
}

/// 저장된 사용자 정보 로드 이벤트
class LoadSavedUser extends AuthEvent {
  const LoadSavedUser();
}

/// 사용자 정보 삭제 이벤트
class ClearUser extends AuthEvent {
  const ClearUser();
}

