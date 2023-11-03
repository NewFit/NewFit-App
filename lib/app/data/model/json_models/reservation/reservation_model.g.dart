// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

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
