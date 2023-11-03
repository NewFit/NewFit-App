// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine_Equipment _$Routine_EquipmentFromJson(Map<String, dynamic> json) =>
    Routine_Equipment(
      sequence: json['sequence'] as int,
      equipment_id: json['equipment_id'] as int,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$Routine_EquipmentToJson(Routine_Equipment instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'equipment_id': instance.equipment_id,
      'duration': instance.duration,
    };
