// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_routine_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRoutineList _$MyRoutineListFromJson(Map<String, dynamic> json) =>
    MyRoutineList(
      routine_id: json['routine_id'] as int,
      routines: (json['routines'] as List<dynamic>)
          .map((e) => MyRoutine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyRoutineListToJson(MyRoutineList instance) =>
    <String, dynamic>{
      'routine_id': instance.routine_id,
      'routines': instance.routines,
    };
