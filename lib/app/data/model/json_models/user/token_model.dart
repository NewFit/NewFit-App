// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class Token {
  String access_token;
  String? refresh_token;
  List<IdInformation> id_informations;

  Token({
    required this.access_token,
    required this.refresh_token,
    required this.id_informations,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class AccessToken {
  String access_token;

  AccessToken({
    required this.access_token,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}

@JsonSerializable()
class IdInformation {
  int id;
  String id_type;

  IdInformation({
    required this.id,
    required this.id_type,
  });

  factory IdInformation.fromJson(Map<String, dynamic> json) =>
      _$IdInformationFromJson(json);

  Map<String, dynamic> toJson() => _$IdInformationToJson(this);
}
