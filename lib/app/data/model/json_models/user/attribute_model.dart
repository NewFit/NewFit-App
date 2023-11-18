import 'package:json_annotation/json_annotation.dart';

part 'attribute_model.g.dart';

@JsonSerializable()
class Attribute {
  String attribute_name;
  String provider_type;

  Attribute({
    required this.attribute_name,
    required this.provider_type,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}
