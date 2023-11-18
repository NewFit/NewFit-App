// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      tel: json['tel'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'nickname': instance.nickname,
      'tel': instance.tel,
    };

UserEmail _$UserEmailFromJson(Map<String, dynamic> json) => UserEmail(
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserEmailToJson(UserEmail instance) => <String, dynamic>{
      'email': instance.email,
    };

ModifyUser _$ModifyUserFromJson(Map<String, dynamic> json) => ModifyUser(
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      tel: json['tel'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ModifyUserToJson(ModifyUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'tel': instance.tel,
      'image': instance.image,
    };
