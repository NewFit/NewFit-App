// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_at_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartAt _$StartAtFromJson(Map<String, dynamic> json) => StartAt(
      start_at: DateTime.parse(json['start_at'] as String),
    );

Map<String, dynamic> _$StartAtToJson(StartAt instance) => <String, dynamic>{
      'start_at': instance.start_at.toIso8601String(),
    };
