import 'package:flutter/foundation.dart';
import '../../models/Nation.dart';
import '../../models/Match.dart';
import '../../models/Stats.dart';



class NationManager with ChangeNotifier {
  List<Nation> _nation = [];
  List<Nation> _match = [];


  int get itemCount {
    return nations.length;
  }

  List<Nation> get nations {
    return [
      Nation(id: '1', name: 'Anh', logo: 'assets/logo/anh.png'),
      Nation(id: '2', name: 'bi', logo: 'assets/logo/bi.png'),
      Nation(id: '3', name: 'Brazil', logo: 'assets/logo/brazil.png'),
      Nation(id: '4', name: 'Tay Ban Nha', logo: 'assets/logo/tay_ban_nha.png'),

    ];
  }

  Nation findById(String id){
    return nations.firstWhere((prod) => prod.id == id);
  }
}