// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRoutine _$PostRoutineFromJson(Map<String, dynamic> json) => PostRoutine(
      routine_name: json['routine_name'] as String,
      routine_equipments: (json['routine_equipments'] as List<dynamic>)
          .map((e) => RoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostRoutineToJson(PostRoutine instance) =>
    <String, dynamic>{
      'routine_name': instance.routine_name,
      'routine_equipments': instance.routine_equipments,
    };
