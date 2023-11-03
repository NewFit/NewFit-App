// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPage _$MyPageFromJson(Map<String, dynamic> json) => MyPage(
      profile_file_path: json['profile_file_path'] as String,
      nickname: json['nickname'] as String,
      total_credit: json['total_credit'] as int,
      this_month_credit: json['this_month_credit'] as int,
      current: Gym.fromJson(json['current'] as Map<String, dynamic>),
      authority_gyms_count: json['authority_gyms_count'] as int,
      authority_gyms: (json['authority_gyms'] as List<dynamic>)
          .map((e) => Gym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyPageToJson(MyPage instance) => <String, dynamic>{
      'profile_file_path': instance.profile_file_path,
      'nickname': instance.nickname,
      'total_credit': instance.total_credit,
      'this_month_credit': instance.this_month_credit,
      'current': instance.current,
      'authority_gyms_count': instance.authority_gyms_count,
      'authority_gyms': instance.authority_gyms,
    };
