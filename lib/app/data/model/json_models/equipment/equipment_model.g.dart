// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      equipment_id: json['equipment_id'] as int,
      equipment_gym_id: json['equipment_gym_id'] as int,
      equipment_gym_name: json['equipment_gym_name'] as String,
      purpose: json['purpose'] as String,
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'equipment_id': instance.equipment_id,
      'equipment_gym_id': instance.equipment_gym_id,
      'equipment_gym_name': instance.equipment_gym_name,
      'purpose': instance.purpose,
      'condition': instance.condition,
    };
