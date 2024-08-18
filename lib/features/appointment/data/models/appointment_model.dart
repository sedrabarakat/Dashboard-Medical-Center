// import 'package:json_annotation/json_annotation.dart';
//
// part 'appointment_model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class AppointmentModel {
//   @JsonKey(name: 'appointment_id')
//   final int id;
//   @JsonKey(name: 'patient_firstName')
//   final String patientFirstName;
//
//   @JsonKey(name: 'patient_lastName')
//   final String patientLastName;
//   @JsonKey(name: 'doctor_id')
//   final int doctorId;
//   @JsonKey(name: 'doctor_firstName')
//   late final String doctorFirstname;
//   @JsonKey(name: 'doctor_lastName')
//   late final String doctorLastName;
//   @JsonKey(name: 'section_id')
//   final int sectionId;
//   @JsonKey(name: 'section_name')
//   final String sectionName;
//
//   final String date;
//   @JsonKey(name: 'start_min')
//   final String startMin;
//
//   AppointmentModel(
//       {required this.date,
//       required this.doctorFirstname,
//       required this.doctorId,
//       required this.doctorLastName,
//       required this.id,
//       required this.patientFirstName,
//       required this.patientLastName,
//       required this.sectionId,
//       required this.sectionName,
//       required this.startMin});
//
//   factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
//       _$AppointmentModelFromJson(json);
//   Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';

import '../../../doctors/data/model/doctor_model.dart';
import '../../../patients/data/models/patient_model.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'patient_id')
  final int patientId;
  final String date;
  @JsonKey(name: 'start_min')
  final String startTime;
  final DoctorModel doctor;
  final PatientModel patient;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.date,
    required this.startTime,
    required this.doctor,
    required this.patient,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
