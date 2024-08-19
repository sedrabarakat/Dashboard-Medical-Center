import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointments_Model_s.g.dart';

@JsonSerializable()
class AppointmentsModelS{
  String date;
  int count;

  AppointmentsModelS(this.count,this.date);

  factory AppointmentsModelS.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsModelSFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentsModelSToJson(this);
}