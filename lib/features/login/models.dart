import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// User 모델 (로그인된 사용자 정보)
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String userId,
    String? password,
    String? phone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

