// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      type: const PetTypeConverter().fromJson(json['type'] as String?),
      breed: json['breed'] as String,
      name: json['name'] as String,
      gender: const PetGenderConverter().fromJson(json['gender'] as String?),
      isNeutered: json['isNeutered'] as bool? ?? false,
      birthday: json['birthday'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      bodyType:
          const PetBodyTypeConverter().fromJson(json['bodyType'] as String?),
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'type': const PetTypeConverter().toJson(instance.type),
      'breed': instance.breed,
      'name': instance.name,
      'gender': const PetGenderConverter().toJson(instance.gender),
      'isNeutered': instance.isNeutered,
      'birthday': instance.birthday,
      'weight': instance.weight,
      'bodyType': const PetBodyTypeConverter().toJson(instance.bodyType),
    };
