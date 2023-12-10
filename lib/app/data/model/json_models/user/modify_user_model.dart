import 'package:json_annotation/json_annotation.dart';

part 'modify_user_model.g.dart';

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
