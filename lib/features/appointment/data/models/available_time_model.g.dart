// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTimeModel _$AvailableTimeModelFromJson(Map<String, dynamic> json) =>
    AvailableTimeModel(
      date: json['date'] as String,
      day: json['day'] as String,
      availableTimes: (json['availableTimes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AvailableTimeModelToJson(AvailableTimeModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'availableTimes': instance.availableTimes,
    };
