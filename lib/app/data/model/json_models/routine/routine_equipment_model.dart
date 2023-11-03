// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'routine_equipment_model.g.dart';

@JsonSerializable()
class Routine_Equipment {
  int sequence;
  int equipment_id;
  int duration;

  Routine_Equipment({
    required this.sequence,
    required this.equipment_id,
    required this.duration,
  });

  factory Routine_Equipment.fromJson(Map<String, dynamic> json) =>
      _$Routine_EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$Routine_EquipmentToJson(this);
}
