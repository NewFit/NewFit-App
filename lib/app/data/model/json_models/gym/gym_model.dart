// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'gym_model.g.dart';

@JsonSerializable()
class Gym {
  int authority_id;
  String gym_name;

  Gym({
    required this.authority_id,
    required this.gym_name,
  });

  factory Gym.fromJson(Map<String, dynamic> json) => _$GymFromJson(json);

  Map<String, dynamic> toJson() => _$GymToJson(this);
}
