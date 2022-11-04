import 'package:flutter/foundation.dart';
import '../models/Nation.dart';
import '../models/Match.dart';


class NationManager with ChangeNotifier {
  List<Nation> _nation = [];
  List<Nation> _match = [];


  int get itemCount {
    return this.matchs.length;
  }

  List<Nation> get nations {
    return [
      Nation(id: '1', name: 'Anh', logo: 'assets/logo/anh.png'),
      Nation(id: '2', name: 'bi', logo: 'assets/logo/bi.png')
    ];
  }

  List<Match> get matchs {
    return [
      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),
      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),
      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),
      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),
      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),

      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),

      Match(id_team_1: '1', id_team_2: '2', date: '12-12-2022', time: '12:00', team_1_goal: 1, team_2_goal: 0),


    ];
  }

  getNation(String id){
    for(int i = 0; i <= this.nations.length; i++){
      if(this.nations[i].id == id){
        return this.nations[i];
      }
    }
  } 

}