// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPageInfo _$MyPageInfoFromJson(Map<String, dynamic> json) => MyPageInfo(
      profile_file_path: json['profile_file_path'] as String,
      nickname: json['nickname'] as String,
      total_credit: json['total_credit'] as int,
      this_month_credit: json['this_month_credit'] as int,
    );

Map<String, dynamic> _$MyPageInfoToJson(MyPageInfo instance) =>
    <String, dynamic>{
      'profile_file_path': instance.profile_file_path,
      'nickname': instance.nickname,
      'total_credit': instance.total_credit,
      'this_month_credit': instance.this_month_credit,
    };
