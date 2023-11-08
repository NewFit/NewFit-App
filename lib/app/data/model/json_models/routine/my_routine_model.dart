// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_equipment_model.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_model.dart';

part 'my_routine_model.g.dart';

@JsonSerializable()
class MyRoutine {
  int routine_id;
  String name;

  MyRoutine({
    required this.routine_id,
    required this.name,
  });

  factory MyRoutine.fromJson(Map<String, dynamic> json) =>
      _$MyRoutineFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoutineToJson(this);
}
