import 'package:flutter/foundation.dart';

class Match {
  final String? id;
  final String id_team_1;
  final String id_team_2;
  final String date;
  final String time;
  final int team_1_goal;
  final int team_2_goal;

  Match({
    this.id,
    required this.id_team_1,
    required this.id_team_2,
    required this.date,
    required this.time,
    required this.team_1_goal,
    required this.team_2_goal,

  });

  Match copyWith({
    String? id,
    String? id_team_1,
    String? id_team_2,
    String? date,
    String? time,
    int? team_1_goal,
    int? team_2_goal,
  }) {
    return Match(
      id: id ?? this.id,
      id_team_1: id_team_1 ?? this.id_team_1,
      id_team_2: id_team_2 ?? this.id_team_1,
      date: date ?? this.date,
      time: time ?? this.time,
      team_1_goal: team_1_goal ?? this.team_1_goal,
      team_2_goal: team_2_goal ?? this.team_2_goal,
    );
  }

}