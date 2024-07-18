import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class Usermodel{
  @JsonKey(name: "first_name")
  String first_name;
  @JsonKey(name: "middle_name")
  String middle_name;
  @JsonKey(name: "last_name")
  String last_name;
  @JsonKey(name: "phone_number")
  String phone_number;
  @JsonKey(name: "user_type")
  String? user_type;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "id")
  int id;

  Usermodel(this.id,this.first_name,this.last_name,this.description,this.middle_name,this.phone_number);

  factory Usermodel.fromJson(Map<String,dynamic>json)=>_$UsermodelFromJson(json);

  Map<String,dynamic> ToJson()=>_$UsermodelToJson(this);



}
