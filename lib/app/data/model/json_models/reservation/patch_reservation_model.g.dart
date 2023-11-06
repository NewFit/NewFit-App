// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchReservation _$PatchReservationFromJson(Map<String, dynamic> json) =>
    PatchReservation(
      equipment_gym_id: json['equipment_gym_id'] as int,
      start_at: DateTime.parse(json['start_at'] as String),
      end_at: DateTime.parse(json['end_at'] as String),
    );

Map<String, dynamic> _$PatchReservationToJson(PatchReservation instance) =>
    <String, dynamic>{
      'equipment_gym_id': instance.equipment_gym_id,
      'start_at': instance.start_at.toIso8601String(),
      'end_at': instance.end_at.toIso8601String(),
    };
