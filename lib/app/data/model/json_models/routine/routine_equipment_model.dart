// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'routine_equipment_model.g.dart';

@JsonSerializable()
class RoutineEquipment {
  int sequence;
  int equipment_id;
  int duration;

  RoutineEquipment({
    required this.sequence,
    required this.equipment_id,
    required this.duration,
  });

  factory RoutineEquipment.fromJson(Map<String, dynamic> json) =>
      _$RoutineEquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineEquipmentToJson(this);
}
