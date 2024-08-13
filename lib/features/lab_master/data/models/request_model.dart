import 'package:dashboad/features/lab_master/data/models/session_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  final int id;
  @JsonKey(name: 'session_id')
  final int sessionId;
  @JsonKey(name: 'service_id')
  final int serviceId;
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'lab_status')
  final String? labStatus;
  final String? description;
  final SessionModel session;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'created_timestamp')
  final int createdTimeStamp;
  RequestModel({
    required this.id,
    required this.sessionId,
    required this.serviceId,
    required this.doctorId,
    this.labStatus,
    this.description,
    required this.session,
    required this.createdDate,
    required this.createdTimeStamp,
  });
  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}
