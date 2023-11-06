// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_model.dart';
import 'package:new_fit/app/data/model/json_models/routine/abbreviated_equipment_model.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_equipment_model.dart';

part 'routine_detail_model.g.dart';

@JsonSerializable()
class RoutineDetail {
  int routine_id;
  String routine_name;
  int equipments_count;
  List<AbbreviatedEquipment> routine_equipments;

  RoutineDetail({
    required this.routine_id,
    required this.routine_name,
    required this.equipments_count,
    required this.routine_equipments,
  });

  factory RoutineDetail.fromJson(Map<String, dynamic> json) =>
      _$RoutineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineDetailToJson(this);
}
