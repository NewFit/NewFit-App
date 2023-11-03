// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:new_fit/app/data/model/json_models/gym_model.dart';

part 'mypage_model.g.dart';

@JsonSerializable()
class MyPage {
  String profile_file_path;
  String nickname;
  int total_credit;
  int this_month_credit;
  Gym current;
  int authority_gyms_count;
  List<Gym> authority_gyms;

  MyPage({
    required this.profile_file_path,
    required this.nickname,
    required this.total_credit,
    required this.this_month_credit,
    required this.current,
    required this.authority_gyms_count,
    required this.authority_gyms,
  });

  factory MyPage.fromJson(Map<String, dynamic> json) => _$MyPageFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageToJson(this);
}
