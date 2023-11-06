// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
