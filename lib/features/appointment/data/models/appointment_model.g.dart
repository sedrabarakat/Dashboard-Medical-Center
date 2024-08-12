// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return AppointmentModel(
    date: json['date'] as String,
    doctorFirstname: json['doctor_firstName'] as String,
    doctorId: (json['doctor_id'] as num).toInt(),
    doctorLastName: json['doctor_lastName'] as String,
    id: (json['appointment_id'] as num).toInt(),
    patientFirstName: json['patient_firstName'] as String,
    patientLastName: json['patient_lastName'] as String,
    secionId: (json['section_id'] as num).toInt(),
    sectionName: json['section_name'] as String,
    startMin: json['start_min'] as String,
  );
}

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'appointment_id': instance.id,
      'patient_firstName': instance.patientFirstName,
      'patient_lastName': instance.patientLastName,
      'doctor_id': instance.doctorId,
      'doctor_firstName': instance.doctorFirstname,
      'doctor_lastName': instance.doctorLastName,
      'section_id': instance.secionId,
      'section_name': instance.sectionName,
      'date': instance.date,
      'start_min': instance.startMin,
    };
