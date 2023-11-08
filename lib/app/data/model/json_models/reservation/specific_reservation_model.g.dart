// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
