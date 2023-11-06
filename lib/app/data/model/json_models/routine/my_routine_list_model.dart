// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/routine/my_routine_model.dart';

part 'my_routine_list_model.g.dart';

@JsonSerializable()
class MyRoutineList {
  int routine_id;
  List<MyRoutine> routines;

  MyRoutineList({
    required this.routine_id,
    required this.routines,
  });

  factory MyRoutineList.fromJson(Map<String, dynamic> json) =>
      _$MyRoutineListFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoutineListToJson(this);
}
