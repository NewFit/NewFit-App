import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String username;
  String email;
  String nickname;
  String tel;

  User({
    required this.username,
    required this.email,
    required this.nickname,
    required this.tel,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
