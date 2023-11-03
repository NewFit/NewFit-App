import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

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
