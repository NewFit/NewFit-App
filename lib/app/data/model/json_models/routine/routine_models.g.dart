// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) => Routine(
      routine_name: json['routine_name'] as String,
      equipment_gym_id: json['equipment_gym_id'] as int,
      reservation: (json['reservation'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'routine_name': instance.routine_name,
      'equipment_gym_id': instance.equipment_gym_id,
      'reservation': instance.reservation,
    };

RoutineId _$RoutineIdFromJson(Map<String, dynamic> json) => RoutineId(
      routine_id: json['routine_id'] as int,
    );

Map<String, dynamic> _$RoutineIdToJson(RoutineId instance) => <String, dynamic>{
      'routine_id': instance.routine_id,
    };

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

RoutineDetail _$RoutineDetailFromJson(Map<String, dynamic> json) =>
    RoutineDetail(
      routine_id: json['routine_id'] as int?,
      routine_name: json['routine_name'] as String?,
      equipments_count: json['equipments_count'] as int?,
      equipments: (json['equipments'] as List<dynamic>?)
          ?.map((e) =>
              RoutineEquipmentWithPurpose.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutineDetailToJson(RoutineDetail instance) =>
    <String, dynamic>{
      'routine_id': instance.routine_id,
      'routine_name': instance.routine_name,
      'equipments_count': instance.equipments_count,
      'equipments': instance.equipments,
    };

PostRoutine _$PostRoutineFromJson(Map<String, dynamic> json) => PostRoutine(
      routine_name: json['routine_name'] as String?,
      routine_equipments: (json['routine_equipments'] as List<dynamic>?)
          ?.map((e) => RoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostRoutineToJson(PostRoutine instance) =>
    <String, dynamic>{
      'routine_name': instance.routine_name,
      'routine_equipments': instance.routine_equipments,
    };

PatchRoutineEquipments _$PatchRoutineEquipmentsFromJson(
        Map<String, dynamic> json) =>
    PatchRoutineEquipments(
      equipments_count: json['equipments_count'] as int,
      equipments: (json['equipments'] as List<dynamic>)
          .map((e) =>
              SummarizedRoutineEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatchRoutineEquipmentsToJson(
        PatchRoutineEquipments instance) =>
    <String, dynamic>{
      'equipments_count': instance.equipments_count,
      'equipments': instance.equipments,
    };

SummarizedRoutineEquipment _$SummarizedRoutineEquipmentFromJson(
        Map<String, dynamic> json) =>
    SummarizedRoutineEquipment(
      equipment_id: json['equipment_id'] as int,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$SummarizedRoutineEquipmentToJson(
        SummarizedRoutineEquipment instance) =>
    <String, dynamic>{
      'equipment_id': instance.equipment_id,
      'duration': instance.duration,
    };

RoutineName _$RoutineNameFromJson(Map<String, dynamic> json) => RoutineName(
      routine_name: json['routine_name'] as String,
    );

Map<String, dynamic> _$RoutineNameToJson(RoutineName instance) =>
    <String, dynamic>{
      'routine_name': instance.routine_name,
    };

MyRoutine _$MyRoutineFromJson(Map<String, dynamic> json) => MyRoutine(
      routine_id: json['routine_id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MyRoutineToJson(MyRoutine instance) => <String, dynamic>{
      'routine_id': instance.routine_id,
      'name': instance.name,
    };

MyRoutineList _$MyRoutineListFromJson(Map<String, dynamic> json) =>
    MyRoutineList(
      routines_count: json['routines_count'] as int?,
      routines: (json['routines'] as List<dynamic>?)
          ?.map((e) => MyRoutine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyRoutineListToJson(MyRoutineList instance) =>
    <String, dynamic>{
      'routines_count': instance.routines_count,
      'routines': instance.routines,
    };
