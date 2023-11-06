// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineDetail _$RoutineDetailFromJson(Map<String, dynamic> json) =>
    RoutineDetail(
      routine_id: json['routine_id'] as int,
      routine_name: json['routine_name'] as String,
      equipments_count: json['equipments_count'] as int,
      routine_equipments: (json['routine_equipments'] as List<dynamic>)
          .map((e) => AbbreviatedEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutineDetailToJson(RoutineDetail instance) =>
    <String, dynamic>{
      'routine_id': instance.routine_id,
      'routine_name': instance.routine_name,
      'equipments_count': instance.equipments_count,
      'routine_equipments': instance.routine_equipments,
    };
