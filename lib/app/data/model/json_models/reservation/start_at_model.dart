// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

part 'start_at_model.g.dart';

@JsonSerializable()
class StartAt {
  DateTime start_at;

  StartAt({
    required this.start_at,
  });

  factory StartAt.fromJson(Map<String, dynamic> json) =>
      _$StartAtFromJson(json);

  Map<String, dynamic> toJson() => _$StartAtListToJson(this);
}
