import 'package:flutter/foundation.dart';
import 'Stats.dart';

class Match {
  final String? id;
  final String id_team_1;
  final String id_team_2;
  final String date;
  final String time;
  final Stats team1;
  final Stats team2;

  Match({
    this.id,
    required this.id_team_1,
    required this.id_team_2,
    required this.date,
    required this.time,
    required this.team1,
    required this.team2,

  });

  Match copyWith({
    String? id,
    String? id_team_1,
    String? id_team_2,
    String? date,
    String? time,
    Stats? team1,
    Stats? team2,
  }) {
    return Match(
      id: id ?? this.id,
      id_team_1: id_team_1 ?? this.id_team_1,
      id_team_2: id_team_2 ?? this.id_team_1,
      date: date ?? this.date,
      time: time ?? this.time,
      team1: team1 ?? this.team1,
      team2: team2 ?? this.team2,
    );
  }

}