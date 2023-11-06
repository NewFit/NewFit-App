// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_equipment_model.dart';

part 'patch_routine_model.g.dart';

@JsonSerializable()
class PatchRoutine {
  String routine_name;
  int add_equipments_count;
  List<RoutineEquipment> add_equipments;
  int update_equipments_count;
  List<RoutineEquipment> update_equipments;
  int remove_equipments_count;
  List<RoutineEquipment> remove_equipments;

  PatchRoutine({
    required this.routine_name,
    required this.add_equipments_count,
    required this.add_equipments,
    required this.update_equipments_count,
    required this.update_equipments,
    required this.remove_equipments_count,
    required this.remove_equipments,
  });

  factory PatchRoutine.fromJson(Map<String, dynamic> json) =>
      _$PatchRoutineFromJson(json);

  Map<String, dynamic> toJson() => _$PatchRoutineToJson(this);
}
