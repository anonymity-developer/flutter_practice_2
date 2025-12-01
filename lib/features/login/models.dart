import 'package:equatable/equatable.dart';

/// User 모델 (로그인된 사용자 정보)
class User extends Equatable {
  final String id;
  final String userId;
  final String? phone;

  const User({
    required this.id,
    required this.userId ,
    this.phone,
  });

  /// JSON에서 User로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      userId: json['userId'] as String,
      phone: json['phone'] as String?,
    );
  }

  /// User를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'phone': phone,
    };
  }

  @override
  List<Object?> get props => [id, userId, phone];
}

