// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';

part 'user_gym_list_model.g.dart';

@JsonSerializable()
class UserGymList {
  int gym_count;
  List<Gym> gyms;

  UserGymList({
    required this.gym_count,
    required this.gyms,
  });

  factory UserGymList.fromJson(Map<String, dynamic> json) =>
      _$UserGymListFromJson(json);

  Map<String, dynamic> toJson() => _$UserGymListToJson(this);
}
