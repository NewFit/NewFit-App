// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation_model.dart';

part 'reservation_list_model.g.dart';

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
