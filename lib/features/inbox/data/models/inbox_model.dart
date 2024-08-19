

import 'package:json_annotation/json_annotation.dart';

part 'inbox_model.g.dart';

@JsonSerializable()
class InboxModel{
  int id;
  String text;

  InboxModel(this.id,this.text);

  factory InboxModel.fromJson(Map<String, dynamic> json) =>
      _$InboxModelFromJson(json);
  Map<String, dynamic> toJson() => _$InboxModelToJson(this);
}