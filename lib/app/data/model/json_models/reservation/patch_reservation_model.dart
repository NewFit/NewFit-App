// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'patch_reservation_model.g.dart';

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
