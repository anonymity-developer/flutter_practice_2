import 'package:equatable/equatable.dart';

/// User 모델 (로그인된 사용자 정보)
class User extends Equatable {
  final String id;
  final String name;
  final String? phone;
  final bool isRegistered; // 앱 등록 여부

  const User({
    required this.id,
    required this.name,
    this.phone,
    required this.isRegistered,
  });

  /// JSON에서 User로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      isRegistered: json['isRegistered'] as bool? ?? false,
    );
  }

  /// User를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'isRegistered': isRegistered,
    };
  }

  @override
  List<Object?> get props => [id, name, phone, isRegistered];
}

