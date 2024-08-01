import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'section_id')
  final int sectionId;
  @JsonKey(name: 'session_durtion')
  final int sessionDuration;
  @JsonKey(name: 'days_in_advance')
  final int daysInAdvance;
  @JsonKey(name: 'user')
  final UserModel userData;
  final SectionModel? section;
  DoctorModel({
    required this.daysInAdvance,
    required this.id,
    required this.sectionId,
    required this.sessionDuration,
    required this.userData,
    required this.userId,
    this.section,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
