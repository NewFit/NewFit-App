// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';

part 'address_gym_list_model.g.dart';

@JsonSerializable()
class AddressGymList {
  int gym_count;
  List<AddressGym> gyms;

  AddressGymList({
    required this.gym_count,
    required this.gyms,
  });

  factory AddressGymList.fromJson(Map<String, dynamic> json) =>
      _$AddressGymListFromJson(json);

  Map<String, dynamic> toJson() => _$AddressGymListToJson(this);
}
