import 'package:json_annotation/json_annotation.dart';

part 'available_time_model.g.dart';

@JsonSerializable()
class AvailableTimeModel {
  final String date;
  final String day;
  final List<String> availableTimes;

  AvailableTimeModel({
    required this.date,
    required this.day,
    required this.availableTimes,
  });

  factory AvailableTimeModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableTimeModelToJson(this);
}
