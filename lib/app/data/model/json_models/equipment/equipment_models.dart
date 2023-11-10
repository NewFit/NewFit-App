// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';

part 'equipment_models.g.dart';

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
