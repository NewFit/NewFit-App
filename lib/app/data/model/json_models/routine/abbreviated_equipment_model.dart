// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'abbreviated_equipment_model.g.dart';

@JsonSerializable()
class AbbreviatedEquipment {
  int equipment_id;
  String name;
  String purpose;

  AbbreviatedEquipment({
    required this.equipment_id,
    required this.name,
    required this.purpose,
  });

  factory AbbreviatedEquipment.fromJson(Map<String, dynamic> json) =>
      _$AbbreviatedEquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$AbbreviatedEquipmentToJson(this);
}
