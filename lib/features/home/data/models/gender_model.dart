import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_model.g.dart';

@JsonSerializable()
class GenderModel{
  String gender;
  int count;

  GenderModel(this.count,this.gender);

  factory GenderModel.fromJson(Map<String, dynamic> json) =>
      _$GenderModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenderModelToJson(this);
}