import 'package:dashboad/features/create_account/data/models/section_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_list_model.g.dart';

@JsonSerializable()
class SectionListModel{

  @JsonKey(name: "sections")
  List<SectionModel>sections;

  SectionListModel(this.sections);

  factory SectionListModel.fromJson(Map<String,dynamic>json)=>_$SectionListModelFromJson(json);

  Map<String,dynamic> ToJson()=>_$SectionListModelToJson(this);


}