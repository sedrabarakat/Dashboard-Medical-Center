import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final int id;
  @JsonKey(name: 'name')
  final String sectionName;
  final List<TempModel>? doctor;
  SectionModel({
    required this.id,
    required this.sectionName,
    this.doctor,
  });
  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}

@JsonSerializable()
class TempModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'section_id')
  final int sectionId;
  @JsonKey(name: 'session_durtion')
  final int sessionDuration;
  @JsonKey(name: 'days_in_advance')
  final int daysInAdvance;
  TempModel({
    required this.daysInAdvance,
    required this.id,
    required this.sectionId,
    required this.sessionDuration,
    required this.userId,
  });
  factory TempModel.fromJson(Map<String, dynamic> json) =>
      _$TempModelFromJson(json);
  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}

@JsonSerializable()
class SectionService {
  final String name;
  final int price;
  SectionService({required this.name, required this.price});
  factory SectionService.fromJson(Map<String, dynamic> json) =>
      _$SectionServiceFromJson(json);
  Map<String, dynamic> toJson() => _$SectionServiceToJson(this);
}
