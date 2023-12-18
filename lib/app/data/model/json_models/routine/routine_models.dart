// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';

part 'routine_models.g.dart';

@JsonSerializable()
class Routine {
  String routine_name;
  int equipment_gym_id;
  List<Reservation> reservation;

  Routine(
      {required this.routine_name,
      required this.equipment_gym_id,
      required this.reservation});

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineToJson(this);
}

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

@JsonSerializable()
class RoutineEquipment {
  int sequence;
  int equipment_id;
  int duration;

  RoutineEquipment({
    required this.sequence,
    required this.equipment_id,
    required this.duration,
  });

  factory RoutineEquipment.fromJson(Map<String, dynamic> json) =>
      _$RoutineEquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineEquipmentToJson(this);
}

@JsonSerializable()
class RoutineDetail {
  int? routine_id;
  String? routine_name;
  int? equipments_count;
  List<RoutineEquipmentWithPurpose>? equipments;

  RoutineDetail({
    this.routine_id,
    this.routine_name,
    this.equipments_count,
    this.equipments,
  });

  factory RoutineDetail.fromJson(Map<String, dynamic> json) =>
      _$RoutineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineDetailToJson(this);
}

@JsonSerializable()
class PostRoutine {
  String? routine_name;
  List<RoutineEquipment>? routine_equipments;

  PostRoutine({
    this.routine_name,
    this.routine_equipments,
  });

  factory PostRoutine.fromJson(Map<String, dynamic> json) =>
      _$PostRoutineFromJson(json);

  Map<String, dynamic> toJson() => _$PostRoutineToJson(this);
}

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

@JsonSerializable()
class MyRoutineList {
  int? routines_count;
  List<MyRoutine>? routines;

  MyRoutineList({
    this.routines_count,
    this.routines,
  });

  factory MyRoutineList.fromJson(Map<String, dynamic> json) =>
      _$MyRoutineListFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoutineListToJson(this);
}
