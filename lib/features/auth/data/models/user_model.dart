import '../../domain/entities/user.dart';

/// Data Model: 외부 데이터 소스(API, DB)와의 데이터 변환 담당
/// - JSON 직렬화/역직렬화
/// - Entity로 변환하여 Domain 레이어에 전달
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.phone,
  });

  /// JSON에서 Model로 변환 (API 응답, DB 조회 시 사용)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
    );
  }

  /// Model을 JSON으로 변환 (API 요청, DB 저장 시 사용)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
    };
  }

  /// Entity로 변환 (Domain 레이어에 전달)
  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      phone: phone,
    );
  }

  /// Entity에서 Model로 변환
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
    );
  }
}

