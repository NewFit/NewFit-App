// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineEquipment _$RoutineEquipmentFromJson(Map<String, dynamic> json) =>
    RoutineEquipment(
      sequence: json['sequence'] as int,
      equipment_id: json['equipment_id'] as int,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$RoutineEquipmentToJson(RoutineEquipment instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'equipment_id': instance.equipment_id,
      'duration': instance.duration,
    };
