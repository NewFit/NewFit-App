// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
