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
class PatchRoutineEquipments {
  int equipments_count;
  List<SummarizedRoutineEquipment> equipments;

  PatchRoutineEquipments({
    required this.equipments_count,
    required this.equipments,
  });

  factory PatchRoutineEquipments.fromJson(Map<String, dynamic> json) =>
      _$PatchRoutineEquipmentsFromJson(json);

  Map<String, dynamic> toJson() => _$PatchRoutineEquipmentsToJson(this);
}

@JsonSerializable()
class SummarizedRoutineEquipment {
  int equipment_id;
  int duration;

  SummarizedRoutineEquipment({
    required this.equipment_id,
    required this.duration,
  });

  factory SummarizedRoutineEquipment.fromJson(Map<String, dynamic> json) =>
      _$SummarizedRoutineEquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$SummarizedRoutineEquipmentToJson(this);
}

@JsonSerializable()
class RoutineName {
  String routin_name;

  RoutineName({
    required this.routin_name,
  });

  factory RoutineName.fromJson(Map<String, dynamic> json) =>
      _$RoutineNameFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineNameToJson(this);
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
