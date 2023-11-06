// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_spec_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
