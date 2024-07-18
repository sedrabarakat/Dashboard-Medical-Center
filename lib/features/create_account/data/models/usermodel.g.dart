// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usermodel _$UsermodelFromJson(Map<String, dynamic> json) => Usermodel(
      (json['id'] as num).toInt(),
      json['first_name'] as String,
      json['last_name'] as String,
      json['description'] as String,
      json['middle_name'] as String,
      json['phone_number'] as String,
    )..user_type = json['user_type'] as String?;

Map<String, dynamic> _$UsermodelToJson(Usermodel instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'middle_name': instance.middle_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'user_type': instance.user_type,
      'description': instance.description,
      'id': instance.id,
    };
