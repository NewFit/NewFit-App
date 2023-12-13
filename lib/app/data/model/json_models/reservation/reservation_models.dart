// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json_datetime_converter.dart';

part 'reservation_models.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime);
  }
}

@JsonSerializable()
class Reservation {
  @DateTimeConverter()
  DateTime start_at;
  @DateTimeConverter()
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
class ReservationWithId {
  int reservation_id;
  @DateTimeConverter()
  DateTime start_at;
  @DateTimeConverter()
  DateTime end_at;

  ReservationWithId({
    required this.reservation_id,
    required this.start_at,
    required this.end_at,
  });

  factory ReservationWithId.fromJson(Map<String, dynamic> json) =>
      _$ReservationWithIdFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationWithIdToJson(this);

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
class ReservationListWithId {
  String gym_name;
  int reservation_count;
  List<ReservationWithId> reservations;

  ReservationListWithId({
    required this.gym_name,
    required this.reservation_count,
    required this.reservations,
  });

  factory ReservationListWithId.fromJson(Map<String, dynamic> json) =>
      _$ReservationListWithIdFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationListWithIdToJson(this);
}

@JsonSerializable()
class SpecificReservation {
  String gym_name;
  int equipment_gym_id;
  List<Reservation> reservation;

  SpecificReservation({
    required this.gym_name,
    required this.equipment_gym_id,
    required this.reservation,
  });

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

@JsonSerializable()
class SpecificEquipmentsReservation {
  int equipment_gyms_count;
  List<EquipmentGym> equipment_gyms;

  SpecificEquipmentsReservation({
    required this.equipment_gyms_count,
    required this.equipment_gyms,
  });

  factory SpecificEquipmentsReservation.fromJson(Map<String, dynamic> json) =>
      _$SpecificEquipmentsReservationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificEquipmentsReservationToJson(this);
}

@JsonSerializable()
class EquipmentGym {
  String gym_name;
  int equipment_gym_id;
  String equipment_gym_name;
  int occupied_times_count;
  List<Reservation> occupied_times;

  EquipmentGym({
    required this.gym_name,
    required this.equipment_gym_id,
    required this.equipment_gym_name,
    required this.occupied_times_count,
    required this.occupied_times,
  });

  factory EquipmentGym.fromJson(Map<String, dynamic> json) =>
      _$EquipmentGymFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentGymToJson(this);
}
