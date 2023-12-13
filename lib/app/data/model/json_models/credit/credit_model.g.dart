// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreBoard _$ScoreBoardFromJson(Map<String, dynamic> json) => ScoreBoard(
      gym_name: json['gym_name'] as String?,
      user_rank_info: json['user_rank_info'] == null
          ? null
          : Rank.fromJson(json['user_rank_info'] as Map<String, dynamic>),
      rankings_count: json['rankings_count'] as int?,
      rankings: (json['rankings'] as List<dynamic>?)
          ?.map((e) => Rank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScoreBoardToJson(ScoreBoard instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'user_rank_info': instance.user_rank_info,
      'rankings_count': instance.rankings_count,
      'rankings': instance.rankings,
    };

Rank _$RankFromJson(Map<String, dynamic> json) => Rank(
      rank: json['rank'] as int,
      nickname: json['nickname'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$RankToJson(Rank instance) => <String, dynamic>{
      'rank': instance.rank,
      'nickname': instance.nickname,
      'amount': instance.amount,
    };
