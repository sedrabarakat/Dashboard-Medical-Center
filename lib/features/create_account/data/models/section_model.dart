
import 'package:json_annotation/json_annotation.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel{
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;


  SectionModel(this.id,this.name,this.image);

  factory SectionModel.fromJson(Map<String,dynamic>json)=>_$SectionModelFromJson(json);

  Map<String,dynamic> ToJson()=>_$SectionModelToJson(this);



}