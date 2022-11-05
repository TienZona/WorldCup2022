import 'package:flutter/foundation.dart';

class Stats {
  final String? team_id;
  final int goal;
  final int shot;
  final int onTarget;
  final int possession;
  final int foul;
  final int yellowCard;
  final int redCard;


  Stats({
    this.team_id,
    required this.goal,
    required this.shot,
    required this.onTarget,
    required this.possession,
    required this.foul,
    required this.yellowCard,
    required this.redCard,

  });

  Stats copyWith({
    String? team_id,
    int? goal,
    int? shot,
    int? onTarget,
    int? possession,
    int? foul,
    int? yellowCard,
    int? redCard,
  }) {
    return Stats(
      team_id: team_id ?? this.team_id,
      goal: goal ?? this.goal,
      shot: shot ?? this.shot,
      onTarget: onTarget ?? this.onTarget,
      possession: possession ?? this.possession,
      foul: foul ?? this.foul,
      yellowCard: yellowCard ?? this.yellowCard,
      redCard: redCard ?? this.redCard,
    );
  }

}