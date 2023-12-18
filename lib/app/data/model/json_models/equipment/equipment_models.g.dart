// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_models.dart';

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

EquipmentList _$EquipmentListFromJson(Map<String, dynamic> json) =>
    EquipmentList(
      gym_name: json['gym_name'] as String,
      equipments_count: json['equipments_count'] as int,
      equipments: (json['equipments'] as List<dynamic>)
          .map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EquipmentListToJson(EquipmentList instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'equipments_count': instance.equipments_count,
      'equipments': instance.equipments,
    };

EquipmentSpec _$EquipmentSpecFromJson(Map<String, dynamic> json) =>
    EquipmentSpec(
      gym_name: json['gym_name'] as String,
      equipment_gym_id: json['equipment_gym_id'] as int,
      equipment_gym_name: json['equipment_gym_name'] as String,
      occupied_times_count: json['occupied_times_count'] as int,
      occupied_times: (json['occupied_times'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EquipmentSpecToJson(EquipmentSpec instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'equipment_gym_id': instance.equipment_gym_id,
      'equipment_gym_name': instance.equipment_gym_name,
      'occupied_times_count': instance.occupied_times_count,
      'occupied_times': instance.occupied_times,
    };

RoutineEquipmentWithPurpose _$RoutineEquipmentWithPurposeFromJson(
        Map<String, dynamic> json) =>
    RoutineEquipmentWithPurpose(
      equipment_id: json['equipment_id'] as int,
      name: json['name'] as String,
      purpose: json['purpose'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$RoutineEquipmentWithPurposeToJson(
        RoutineEquipmentWithPurpose instance) =>
    <String, dynamic>{
      'equipment_id': instance.equipment_id,
      'name': instance.name,
      'purpose': instance.purpose,
      'duration': instance.duration,
    };
