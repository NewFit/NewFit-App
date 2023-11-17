// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      start_at: DateTime.parse(json['start_at'] as String),
      end_at: DateTime.parse(json['end_at'] as String),
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'start_at': instance.start_at.toIso8601String(),
      'end_at': instance.end_at.toIso8601String(),
    };

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

ReservationList _$ReservationListFromJson(Map<String, dynamic> json) =>
    ReservationList(
      gym_name: json['gym_name'] as String,
      reservation_count: json['reservation_count'] as int,
      reservations: (json['reservations'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationListToJson(ReservationList instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'reservation_count': instance.reservation_count,
      'reservations': instance.reservations,
    };

SpecificReservation _$SpecificReservationFromJson(Map<String, dynamic> json) =>
    SpecificReservation(
      gym_name: json['gym_name'] as String,
      equipment_gym_id: json['equipment_gym_id'] as int,
      reservation: (json['reservation'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecificReservationToJson(
        SpecificReservation instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'equipment_gym_id': instance.equipment_gym_id,
      'reservation': instance.reservation,
    };

StartAt _$StartAtFromJson(Map<String, dynamic> json) => StartAt(
      start_at: DateTime.parse(json['start_at'] as String),
    );

Map<String, dynamic> _$StartAtToJson(StartAt instance) => <String, dynamic>{
      'start_at': instance.start_at.toIso8601String(),
    };