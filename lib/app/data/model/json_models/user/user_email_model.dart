import 'package:json_annotation/json_annotation.dart';

part 'user_email_model.g.dart';

@JsonSerializable()
class UserEmail {
  String email;

  UserEmail({
    required this.email,
  });

  factory UserEmail.fromJson(Map<String, dynamic> json) =>
      _$UserEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailToJson(this);
}
