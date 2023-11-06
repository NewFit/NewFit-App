// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_model.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'equipment_spec_model.g.dart';

@JsonSerializable()
class EquipmentSpec {
  String gym_name;
  int equipment_gym_id;
  String equipment_gym_name;
  int occupied_times_count;
  List<Reservation> occupied_times;

  EquipmentSpec({
    required this.gym_name,
    required this.equipment_gym_id,
    required this.equipment_gym_name,
    required this.occupied_times_count,
    required this.occupied_times,
  });

  factory EquipmentSpec.fromJson(Map<String, dynamic> json) =>
      _$EquipmentSpecFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentSpecToJson(this);
}
