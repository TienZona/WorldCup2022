import 'package:flutter/foundation.dart';
import 'Stats.dart';

class Match {
  final String? id;
  final String date;
  final String time;
  final String t1_id;
  final int t1_goal;
  final int t1_shot;
  final int t1_onTarget;
  final int t1_possession;
  final int t1_foul;
  final int t1_yellowCard;
  final int t1_redCard;
  final String t2_id;
  final int t2_goal;
  final int t2_shot;
  final int t2_onTarget;
  final int t2_possession;
  final int t2_foul;
  final int t2_yellowCard;
  final int t2_redCard;


  Match({
    this.id,
    required this.date,
    required this.time,
    required this.t1_id,
    required this.t1_goal,
    required this.t1_shot,
    required this.t1_onTarget,
    required this.t1_possession,
    required this.t1_foul,
    required this.t1_yellowCard,
    required this.t1_redCard,
    required this.t2_id,
    required this.t2_goal,
    required this.t2_shot,
    required this.t2_onTarget,
    required this.t2_possession,
    required this.t2_foul,
    required this.t2_yellowCard,
    required this.t2_redCard
  });

  Match copyWith({
    String? id,
    String? date,
    String? time,
    String? t1_id,
    int? t1_goal,
    int? t1_shot,
    int? t1_onTarget,
    int? t1_possession,
    int? t1_foul,
    int? t1_yellowCard,
    int? t1_redCard,
    String? t2_id,
    int? t2_goal,
    int? t2_shot,
    int? t2_onTarget,
    int? t2_possession,
    int? t2_foul,
    int? t2_yellowCard,
    int? t2_redCard
  }) {
    return Match(
      id: id ?? this.id,
      date: date ?? this.date,
      time: time ?? this.time,
      t1_id: t1_id ?? this.t1_id,
      t1_goal: t1_goal ?? this.t1_goal,
      t1_shot: t1_shot ?? this.t1_shot,
      t1_onTarget: t1_onTarget ?? this.t1_onTarget,
      t1_possession: t1_possession ?? this.t1_possession,
      t1_foul: t1_foul ?? this.t1_foul,
      t1_yellowCard: t1_yellowCard ?? this.t1_yellowCard,
      t1_redCard: t1_redCard ?? this.t1_redCard,
      t2_id: t2_id ?? this.t2_id,
      t2_goal: t2_goal ?? this.t2_goal,
      t2_shot: t2_shot ?? this.t2_shot,
      t2_onTarget: t2_onTarget ?? this.t2_onTarget,
      t2_possession: t2_possession ?? this.t2_possession,
      t2_foul: t2_foul ?? this.t2_foul,
      t2_yellowCard: t2_yellowCard ?? this.t2_yellowCard,
      t2_redCard: t2_redCard ?? this.t2_redCard
    );
  }

}