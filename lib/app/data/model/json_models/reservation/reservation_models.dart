// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'reservation_models.g.dart';

@JsonSerializable()
class Reservation {
  DateTime start_at;
  DateTime end_at;

  Reservation({
    required this.start_at,
    required this.end_at,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationToJson(this);

  int totalMinute() {
    return Duration(hours: end_at.hour, minutes: end_at.minute).inMinutes -
        Duration(hours: start_at.hour, minutes: start_at.minute).inMinutes;
  }
}

@JsonSerializable()
class PatchReservation {
  int equipment_gym_id;
  DateTime start_at;
  DateTime end_at;

  PatchReservation({
    required this.equipment_gym_id,
    required this.start_at,
    required this.end_at,
  });

  factory PatchReservation.fromJson(Map<String, dynamic> json) =>
      _$PatchReservationFromJson(json);

  Map<String, dynamic> toJson() => _$PatchReservationToJson(this);
}

@JsonSerializable()
class ReservationList {
  String gym_name;
  int reservation_count;
  List<Reservation> reservations;

  ReservationList({
    required this.gym_name,
    required this.reservation_count,
    required this.reservations,
  });

  factory ReservationList.fromJson(Map<String, dynamic> json) =>
      _$ReservationListFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationListToJson(this);
}

@JsonSerializable()
class SpecificReservation {
  String gym_name;
  int equipment_gym_id;
  List<Reservation> reservation;

  SpecificReservation(
      {required this.gym_name,
      required this.equipment_gym_id,
      required this.reservation});

  factory SpecificReservation.fromJson(Map<String, dynamic> json) =>
      _$SpecificReservationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificReservationToJson(this);
}

@JsonSerializable()
class StartAt {
  DateTime start_at;

  StartAt({
    required this.start_at,
  });

  factory StartAt.fromJson(Map<String, dynamic> json) =>
      _$StartAtFromJson(json);

  Map<String, dynamic> toJson() => _$StartAtToJson(this);
}

@JsonSerializable()
class EndAt {
  DateTime end_at;

  EndAt({
    required this.end_at,
  });

  factory EndAt.fromJson(Map<String, dynamic> json) => _$EndAtFromJson(json);

  Map<String, dynamic> toJson() => _$EndAtToJson(this);
}
