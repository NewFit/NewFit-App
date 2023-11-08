// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchRoutine _$PatchRoutineFromJson(Map<String, dynamic> json) => PatchRoutine(
      routine_name: json['routine_name'] as String,
      add_equipments_count: json['add_equipments_count'] as int,
      add_equipments: (json['add_equipments'] as List<dynamic>)
          .map((e) => RoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      update_equipments_count: json['update_equipments_count'] as int,
      update_equipments: (json['update_equipments'] as List<dynamic>)
          .map((e) => RoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      remove_equipments_count: json['remove_equipments_count'] as int,
      remove_equipments: (json['remove_equipments'] as List<dynamic>)
          .map((e) => RoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatchRoutineToJson(PatchRoutine instance) =>
    <String, dynamic>{
      'routine_name': instance.routine_name,
      'add_equipments_count': instance.add_equipments_count,
      'add_equipments': instance.add_equipments,
      'update_equipments_count': instance.update_equipments_count,
      'update_equipments': instance.update_equipments,
      'remove_equipments_count': instance.remove_equipments_count,
      'remove_equipments': instance.remove_equipments,
    };
