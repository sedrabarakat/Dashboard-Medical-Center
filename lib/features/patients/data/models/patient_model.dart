import 'package:dashboad/core/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'birth_date')
  final DateTime birthDate;
  final String age;
  final String gender;
  final String address;

  @JsonKey(name: 'blood_type')
  final String bloodType;
  @JsonKey(name: 'marital_status')
  final String maritalStatus;
  @JsonKey(name: 'children_num')
  final int? childrenNum;
  final String? habits;
  final String proffesion;
  @JsonKey(readValue: transferBooleanToInt)
  final int diabetes;
  @JsonKey(name: 'blood_pressure', readValue: transferBooleanToInt)
  final int bloodPressure;
  final int wallet;
  @JsonKey(name: 'user')
  final UserModel userData;
  PatientModel({
    required this.address,
    required this.age,
    required this.birthDate,
    required this.bloodPressure,
    required this.bloodType,
    required this.childrenNum,
    required this.diabetes,
    required this.gender,
    required this.habits,
    required this.id,
    required this.maritalStatus,
    required this.proffesion,
    required this.userData,
    required this.userId,
    required this.wallet,
  });
  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);

  // Made this function because the blood_type and the diabets sometimes come from the back end as a boolean and other time int
  static transferBooleanToInt(map, key) {
    if (map[key] is bool) {
      return map[key] ? 1 : 0;
    } else {
      return map[key];
    }
  }
}
