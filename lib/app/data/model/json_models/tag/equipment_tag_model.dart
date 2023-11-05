// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'equipment_tag_model.g.dart';

@JsonSerializable()
class EquipmentTag {
  DateTime tag_at;
  int equipment_gym_id;

  EquipmentTag({
    required this.tag_at,
    required this.equipment_gym_id,
  });

  factory EquipmentTag.fromJson(Map<String, dynamic> json) =>
      _$EquipmentTagFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentTagToJson(this);
}
