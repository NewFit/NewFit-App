// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrance_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntranceTag _$EntranceTagFromJson(Map<String, dynamic> json) => EntranceTag(
      gym_id: json['gym_id'] as int,
      tag_at: const DateTimeConverter().fromJson(json['tag_at'] as String),
    );

Map<String, dynamic> _$EntranceTagToJson(EntranceTag instance) =>
    <String, dynamic>{
      'gym_id': instance.gym_id,
      'tag_at': const DateTimeConverter().toJson(instance.tag_at),
    };
