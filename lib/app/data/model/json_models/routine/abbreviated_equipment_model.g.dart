// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abbreviated_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbbreviatedEquipment _$AbbreviatedEquipmentFromJson(
        Map<String, dynamic> json) =>
    AbbreviatedEquipment(
      equipment_id: json['equipment_id'] as int,
      name: json['name'] as String,
      purpose: json['purpose'] as String,
    );

Map<String, dynamic> _$AbbreviatedEquipmentToJson(
        AbbreviatedEquipment instance) =>
    <String, dynamic>{
      'equipment_id': instance.equipment_id,
      'name': instance.name,
      'purpose': instance.purpose,
    };
