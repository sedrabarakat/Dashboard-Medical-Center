// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      daysInAdvance: (json['days_in_advance'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      section: SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      sectionId: (json['section_id'] as num).toInt(),
      sessionDuration: (json['session_durtion'] as num).toInt(),
      userData: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'section_id': instance.sectionId,
      'session_durtion': instance.sessionDuration,
      'days_in_advance': instance.daysInAdvance,
      'user': instance.userData,
      'section': instance.section,
    };
