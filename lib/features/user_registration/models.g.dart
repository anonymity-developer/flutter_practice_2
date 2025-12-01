// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegistrationDataImpl _$$UserRegistrationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegistrationDataImpl(
      nickname: json['nickname'] as String?,
      birthday: json['birthday'] as String?,
      gender: const UserGenderConverter().fromJson(json['gender'] as String?),
      referralCode: json['referralCode'] as String?,
      serviceTerms: json['serviceTerms'] as bool? ?? false,
      privacyPolicy: json['privacyPolicy'] as bool? ?? false,
      locationInfo: json['locationInfo'] as bool? ?? false,
      marketingInfo: json['marketingInfo'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserRegistrationDataImplToJson(
        _$UserRegistrationDataImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'birthday': instance.birthday,
      'gender': const UserGenderConverter().toJson(instance.gender),
      'referralCode': instance.referralCode,
      'serviceTerms': instance.serviceTerms,
      'privacyPolicy': instance.privacyPolicy,
      'locationInfo': instance.locationInfo,
      'marketingInfo': instance.marketingInfo,
    };
