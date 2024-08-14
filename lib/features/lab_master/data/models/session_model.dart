import 'package:json_annotation/json_annotation.dart';
part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  final int id;
  @JsonKey(name: 'patient_id')
  final int patientId;
  final int closed;
  final String total;
  final LabMasterPatientModel patient;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'created_timestamp')
  final int createdTimeStamp;
  SessionModel({
    required this.closed,
    required this.createdDate,
    required this.createdTimeStamp,
    required this.id,
    required this.patient,
    required this.patientId,
    required this.total,
  });
  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class LabMasterPatientModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'user_id')
  final int userId;
  LabMasterPatientModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.userId,
  });
  String get fullName => '$firstName $middleName';
  factory LabMasterPatientModel.fromJson(Map<String, dynamic> json) =>
      _$LabMasterPatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$LabMasterPatientModelToJson(this);
}
