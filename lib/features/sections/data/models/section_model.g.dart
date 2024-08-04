// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) => SectionModel(
      id: (json['id'] as num).toInt(),
      sectionName: json['name'] as String,
      doctor: (json['doctor'] as List<dynamic>?)
          ?.map((e) => TempModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.sectionName,
      'doctor': instance.doctor,
    };

TempModel _$TempModelFromJson(Map<String, dynamic> json) => TempModel(
      daysInAdvance: (json['days_in_advance'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      sectionId: (json['section_id'] as num).toInt(),
      sessionDuration: (json['session_durtion'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$TempModelToJson(TempModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'section_id': instance.sectionId,
      'session_durtion': instance.sessionDuration,
      'days_in_advance': instance.daysInAdvance,
    };
