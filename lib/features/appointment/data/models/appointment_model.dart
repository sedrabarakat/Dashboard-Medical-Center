import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../doctors/data/model/doctor_model.dart';

part 'appointment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppointmentModel {
  final int id;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'patient_id')
  final int patientId;
  final String date;
  @JsonKey(name: 'start_min')
  final String startMin;
  final PatientModel patient;
  final DoctorModel doctor;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.date,
    required this.startMin,
    required this.patient,
    required this.doctor,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
