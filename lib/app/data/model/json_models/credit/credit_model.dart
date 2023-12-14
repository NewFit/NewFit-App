// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'credit_model.g.dart';

@JsonSerializable()
class ScoreBoard {
  String? gym_name;
  Rank? user_rank_info;
  int? rankings_count;
  List<Rank>? rankings;

  ScoreBoard({
    this.gym_name,
    this.user_rank_info,
    this.rankings_count,
    this.rankings,
  });

  factory ScoreBoard.fromJson(Map<String, dynamic> json) =>
      _$ScoreBoardFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreBoardToJson(this);
}

@JsonSerializable()
class Rank {
  int rank;
  String nickname;
  int amount;

  Rank({
    required this.rank,
    required this.nickname,
    required this.amount,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);

  Map<String, dynamic> toJson() => _$RankToJson(this);
}
