// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      json['birth_date'] as String,
      json['age'] as String,
      json['gender'] as String,
      json['address'] as String,
      json['blood_type'] as String,
      json['marital_status'] as String,
      (json['children_num'] as num).toInt(),
      json['habits'] as String,
      json['proffesion'] as String,
      json['diabetes'] as bool,
      json['blood_pressure'] as bool,
      (json['wallet'] as num).toDouble(),
      Usermodel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'birth_date': instance.birth_date,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'blood_type': instance.blood_type,
      'marital_status': instance.marital_status,
      'children_num': instance.children_num,
      'habits': instance.habits,
      'proffesion': instance.proffesion,
      'diabetes': instance.diabetes,
      'blood_pressure': instance.blood_pressure,
      'wallet': instance.wallet,
      'user': instance.user,
    };
