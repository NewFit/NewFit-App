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

@JsonSerializable()
class ModifyUser {
  String email;
  String nickname;
  String tel;
  String image;

  ModifyUser({
    required this.email,
    required this.nickname,
    required this.tel,
    required this.image,
  });

  factory ModifyUser.fromJson(Map<String, dynamic> json) =>
      _$ModifyUserFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyUserToJson(this);
}
