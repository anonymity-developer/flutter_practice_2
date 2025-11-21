import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

/// BLoC State: UI에 표시할 상태를 나타냄
/// - 로딩, 성공, 실패, 초기 상태 등
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// 초기 상태
class AuthInitial extends AuthState {}

/// 로딩 중 상태
class AuthLoading extends AuthState {}

/// 성공 상태 (사용자 정보 포함)
class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

/// 실패 상태 (에러 메시지 포함)
class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

