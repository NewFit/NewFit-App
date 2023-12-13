// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';

part 'mypage_model.g.dart';

@JsonSerializable()
class MyPageInfo {
  String? profile_file_path;
  String? nickname;
  int? total_credit;
  int? this_month_credit;
  AuthorityGym? current;
  int? authority_gyms_count;
  List<AuthorityGym>? authority_gyms;

  MyPageInfo({
    this.profile_file_path,
    this.nickname,
    this.total_credit,
    this.this_month_credit,
    this.current,
    this.authority_gyms_count,
    this.authority_gyms,
  });

  factory MyPageInfo.fromJson(Map<String, dynamic> json) =>
      _$MyPageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageInfoToJson(this);
}

@JsonSerializable()
class MyPageInfoNotRegistered {
  String profile_file_path;
  String nickname;
  int total_credit;
  int this_month_credit;

  MyPageInfoNotRegistered({
    required this.profile_file_path,
    required this.nickname,
    required this.total_credit,
    required this.this_month_credit,
  });

  factory MyPageInfoNotRegistered.fromJson(Map<String, dynamic> json) =>
      _$MyPageInfoNotRegisteredFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageInfoNotRegisteredToJson(this);
}
