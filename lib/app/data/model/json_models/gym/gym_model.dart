// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'gym_model.g.dart';

@JsonSerializable()
class AuthorityGym {
  int authority_id;
  String gym_name;

  AuthorityGym({
    required this.authority_id,
    required this.gym_name,
  });

  factory AuthorityGym.fromJson(Map<String, dynamic> json) =>
      _$AuthorityGymFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorityGymToJson(this);
}

@JsonSerializable()
class AddressGym {
  int gym_id;
  String gym_name;
  String address;

  AddressGym({
    required this.gym_id,
    required this.gym_name,
    required this.address,
  });

  factory AddressGym.fromJson(Map<String, dynamic> json) =>
      _$AddressGymFromJson(json);

  Map<String, dynamic> toJson() => _$AddressGymToJson(this);
}

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
