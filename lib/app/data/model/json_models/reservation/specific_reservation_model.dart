// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'specific_reservation_model.g.dart';

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
