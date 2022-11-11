import 'package:flutter/foundation.dart';
import '../../models/Nation.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';



class MatchManager with ChangeNotifier {
  List<Nation> _match = [];


  int get itemCount {
    return matchs.length;
  }

  List<Match> get matchs {
    return [
      Match(
        id: '1',
        date: '12-12-2022', 
        time: '12:00', 
        t1_id: '1',
        t1_goal: 1,
        t1_shot: 1,
        t1_onTarget: 1,
        t1_possession: 1,
        t1_foul: 1,
        t1_yellowCard: 1,
        t1_redCard: 1,
        t2_id: '1',
        t2_goal: 1,
        t2_shot: 1,
        t2_onTarget: 1,
        t2_possession: 1,
        t2_foul: 1,
        t2_yellowCard: 1,
        t2_redCard: 1
      ),
      Match(
        id: '1',
        date: '12-12-2022', 
        time: '12:00', 
        t1_id: '1',
        t1_goal: 1,
        t1_shot: 1,
        t1_onTarget: 1,
        t1_possession: 1,
        t1_foul: 1,
        t1_yellowCard: 1,
        t1_redCard: 1,
        t2_id: '1',
        t2_goal: 1,
        t2_shot: 1,
        t2_onTarget: 1,
        t2_possession: 1,
        t2_foul: 1,
        t2_yellowCard: 1,
        t2_redCard: 1
      ),
    ];
  }
  Match findById(String id){
    return matchs.firstWhere((prod) => prod.id == id);
  }
}