// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'routine_id_model.g.dart';

@JsonSerializable()
class RoutineId {
  int routine_id;

  RoutineId({
    required this.routine_id,
  });

  factory RoutineId.fromJson(Map<String, dynamic> json) =>
      _$RoutineIdFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineIdToJson(this);
}
