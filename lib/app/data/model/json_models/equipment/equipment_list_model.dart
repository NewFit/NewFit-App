// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_model.dart';

part 'equipment_list_model.g.dart';

@JsonSerializable()
class EquipmentList {
  String gym_name;
  int equipments_count;
  List<Equipment> equipments;

  EquipmentList({
    required this.gym_name,
    required this.equipments_count,
    required this.equipments,
  });

  factory EquipmentList.fromJson(Map<String, dynamic> json) =>
      _$EquipmentListFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentListToJson(this);
}
