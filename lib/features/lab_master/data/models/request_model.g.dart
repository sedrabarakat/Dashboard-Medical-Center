// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      id: (json['id'] as num).toInt(),
      sessionId: (json['session_id'] as num).toInt(),
      serviceId: (json['service_id'] as num).toInt(),
      doctorId: (json['doctor_id'] as num).toInt(),
      labStatus: json['lab_status'] as String?,
      description: json['description'] as String?,
      session: SessionModel.fromJson(json['session'] as Map<String, dynamic>),
      createdDate: json['created_date'] as String,
      createdTimeStamp: (json['created_timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'service_id': instance.serviceId,
      'doctor_id': instance.doctorId,
      'lab_status': instance.labStatus,
      'description': instance.description,
      'session': instance.session,
      'created_date': instance.createdDate,
      'created_timestamp': instance.createdTimeStamp,
    };
