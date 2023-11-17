// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentTag _$EquipmentTagFromJson(Map<String, dynamic> json) => EquipmentTag(
      tag_at: DateTime.parse(json['tag_at'] as String),
      equipment_gym_id: json['equipment_gym_id'] as int,
    );

Map<String, dynamic> _$EquipmentTagToJson(EquipmentTag instance) =>
    <String, dynamic>{
      'tag_at': instance.tag_at.toIso8601String(),
      'equipment_gym_id': instance.equipment_gym_id,
    };
