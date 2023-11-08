// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'entrance_tag_model.g.dart';

@JsonSerializable()
class EntranceTag {
  int gym_id;
  DateTime tag_at;

  EntranceTag({
    required this.gym_id,
    required this.tag_at,
  });

  factory EntranceTag.fromJson(Map<String, dynamic> json) =>
      _$EntranceTagFromJson(json);

  Map<String, dynamic> toJson() => _$EntranceTagToJson(this);
}
