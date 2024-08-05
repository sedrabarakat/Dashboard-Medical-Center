// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionListModel _$SectionListModelFromJson(Map<String, dynamic> json) =>
    SectionListModel(
      (json['sections'] as List<dynamic>)
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionListModelToJson(SectionListModel instance) =>
    <String, dynamic>{
      'sections': instance.sections,
    };
