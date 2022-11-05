import 'package:flutter/foundation.dart';
import '../../models/Nation.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';



class NationManager with ChangeNotifier {
  List<Nation> _nation = [];
  List<Nation> _match = [];


  int get itemCount {
    return 1;
  }

  List<Nation> get nations {
    return [
      Nation(id: '1', name: 'Anh', logo: 'assets/logo/anh.png'),
      Nation(id: '2', name: 'bi', logo: 'assets/logo/bi.png')
    ];
  }

  Match get matchs {
    return Match(
        id_team_1: '1', 
        id_team_2: '2', 
        date: '12-12-2022', 
        time: '12:00', 
        team1: Stats(
          goal: 1,
          shot: 1,
          onTarget: 1,
          possession: 1,
          foul: 1,
          yellowCard: 1,
          redCard: 1
        ),
        team2: Stats(
          goal: 1,
          shot: 1,
          onTarget: 1,
          possession: 1,
          foul: 1,
          yellowCard: 1,
          redCard: 1
        )
      );
  }

  getNation(String id){
    for(int i = 0; i <= this.nations.length; i++){
      if(this.nations[i].id == id){
        return this.nations[i];
      }
    }
  } 

}