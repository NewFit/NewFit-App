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
  String gym_name;
  String address;

  AddressGym({
    required this.gym_name,
    required this.address,
  });

  factory AddressGym.fromJson(Map<String, dynamic> json) =>
      _$AddressGymFromJson(json);

  Map<String, dynamic> toJson() => _$AddressGymToJson(this);
}
