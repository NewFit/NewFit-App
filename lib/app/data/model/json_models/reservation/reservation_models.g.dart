// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      start_at: const DateTimeConverter().fromJson(json['start_at'] as String),
      end_at: const DateTimeConverter().fromJson(json['end_at'] as String),
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'start_at': const DateTimeConverter().toJson(instance.start_at),
      'end_at': const DateTimeConverter().toJson(instance.end_at),
    };

ReservationWithId _$ReservationWithIdFromJson(Map<String, dynamic> json) =>
    ReservationWithId(
      reservation_id: json['reservation_id'] as int,
      start_at: const DateTimeConverter().fromJson(json['start_at'] as String),
      end_at: const DateTimeConverter().fromJson(json['end_at'] as String),
    );

Map<String, dynamic> _$ReservationWithIdToJson(ReservationWithId instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservation_id,
      'start_at': const DateTimeConverter().toJson(instance.start_at),
      'end_at': const DateTimeConverter().toJson(instance.end_at),
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
          .map((e) => ReservationWithId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationListToJson(ReservationList instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'reservation_count': instance.reservation_count,
      'reservations': instance.reservations,
    };

ReservationListWithId _$ReservationListWithIdFromJson(
        Map<String, dynamic> json) =>
    ReservationListWithId(
      gym_name: json['gym_name'] as String,
      reservation_count: json['reservation_count'] as int,
      reservations: (json['reservations'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationListWithIdToJson(
        ReservationListWithId instance) =>
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

EndAt _$EndAtFromJson(Map<String, dynamic> json) => EndAt(
      end_at: DateTime.parse(json['end_at'] as String),
    );

Map<String, dynamic> _$EndAtToJson(EndAt instance) => <String, dynamic>{
      'end_at': instance.end_at.toIso8601String(),
    };

SpecificEquipmentsReservation _$SpecificEquipmentsReservationFromJson(
        Map<String, dynamic> json) =>
    SpecificEquipmentsReservation(
      equipment_gyms_count: json['equipment_gyms_count'] as int,
      equipment_gyms: (json['equipment_gyms'] as List<dynamic>)
          .map((e) => EquipmentGym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecificEquipmentsReservationToJson(
        SpecificEquipmentsReservation instance) =>
    <String, dynamic>{
      'equipment_gyms_count': instance.equipment_gyms_count,
      'equipment_gyms': instance.equipment_gyms,
    };

EquipmentGym _$EquipmentGymFromJson(Map<String, dynamic> json) => EquipmentGym(
      gym_name: json['gym_name'] as String,
      equipment_gym_id: json['equipment_gym_id'] as int,
      equipment_gym_name: json['equipment_gym_name'] as String,
      occupied_times_count: json['occupied_times_count'] as int,
      occupied_times: (json['occupied_times'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EquipmentGymToJson(EquipmentGym instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'equipment_gym_id': instance.equipment_gym_id,
      'equipment_gym_name': instance.equipment_gym_name,
      'occupied_times_count': instance.occupied_times_count,
      'occupied_times': instance.occupied_times,
    };
