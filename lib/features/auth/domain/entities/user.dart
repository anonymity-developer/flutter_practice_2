import 'package:equatable/equatable.dart';

/// Domain Entity: 비즈니스 로직의 핵심 객체
/// - 순수한 Dart 클래스 (플랫폼 의존성 없음)
/// - 데이터베이스나 API 구조와 무관한 순수한 비즈니스 모델
class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? phone;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
  });

  @override
  List<Object?> get props => [id, email, name, phone];
}

