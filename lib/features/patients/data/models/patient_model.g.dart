// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      address: json['address'] as String,
      age: json['age'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      bloodPressure:
          (PatientModel.transferBooleanToInt(json, 'blood_pressure') as num)
              .toInt(),
      bloodType: json['blood_type'] as String,
      childrenNum: (json['children_num'] as num?)?.toInt(),
      diabetes:
          (PatientModel.transferBooleanToInt(json, 'diabetes') as num).toInt(),
      gender: json['gender'] as String,
      habits: json['habits'] as String?,
      id: (json['id'] as num).toInt(),
      maritalStatus: json['marital_status'] as String,
      proffesion: json['proffesion'] as String,
      userData: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
      wallet: (json['wallet'] as num).toInt(),
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'birth_date': instance.birthDate.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'blood_type': instance.bloodType,
      'marital_status': instance.maritalStatus,
      'children_num': instance.childrenNum,
      'habits': instance.habits,
      'proffesion': instance.proffesion,
      'diabetes': instance.diabetes,
      'blood_pressure': instance.bloodPressure,
      'wallet': instance.wallet,
      'user': instance.userData,
    };
