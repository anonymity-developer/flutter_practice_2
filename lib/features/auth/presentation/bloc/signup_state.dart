import 'package:equatable/equatable.dart';
import '../../domain/entities/signup_data.dart';

/// 회원가입 정보 관리 BLoC State
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

/// 초기 상태 (빈 SignupData)
class SignupInitial extends SignupState {
  final SignupData data;

  const SignupInitial(this.data);

  @override
  List<Object?> get props => [data];
}

/// 로딩 중
class SignupLoading extends SignupState {}

/// 회원가입 정보 로드 완료
class SignupDataLoaded extends SignupState {
  final SignupData data;

  const SignupDataLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

/// 회원가입 정보 저장 완료
class SignupDataSaved extends SignupState {
  final SignupData data;

  const SignupDataSaved(this.data);

  @override
  List<Object?> get props => [data];
}

