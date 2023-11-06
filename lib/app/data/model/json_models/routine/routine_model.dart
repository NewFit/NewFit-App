// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'routine_model.g.dart';

@JsonSerializable()
class Routine {
  String routine_name;
  int equipment_gym_id;
  List<Reservation> reservation;

  Routine(
      {required this.routine_name,
      required this.equipment_gym_id,
      required this.reservation});

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineToJson(this);
}
