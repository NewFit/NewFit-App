// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'equipment_model.g.dart';

@JsonSerializable()
class Equipment {
  int equipment_id;
  int equipment_gym_id;
  String equipment_gym_name;
  String purpose;
  String condition;

  Equipment({
    required this.equipment_id,
    required this.equipment_gym_id,
    required this.equipment_gym_name,
    required this.purpose,
    required this.condition,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
