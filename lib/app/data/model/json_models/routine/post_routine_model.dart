// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_equipment_model.dart';

part 'post_routine_model.g.dart';

@JsonSerializable()
class PostRoutine {
  String routine_name;
  List<RoutineEquipment> routine_equipments;

  PostRoutine({
    required this.routine_name,
    required this.routine_equipments,
  });

  factory PostRoutine.fromJson(Map<String, dynamic> json) =>
      _$PostRoutineFromJson(json);

  Map<String, dynamic> toJson() => _$PostRoutineToJson(this);
}
