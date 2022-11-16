import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
import '../../models/match.dart';
import '../../services/matchs_service.dart';


class MatchManager with ChangeNotifier {
  List<Match> _items = [];

  final MatchsService _matchsService;

  MatchManager([AuthToken? authToken])
    : _matchsService = MatchsService(authToken);

  set authToken(AuthToken? authToken){
    _matchsService.authToken = authToken;
  }

  Future<void> fetchMatchs([bool filterByUser = false]) async {
    _items = (await _matchsService.fetchMatchs());
    notifyListeners();
  }
  int get itemCount {
    return _items.length;
  }

  List<Match> get matchs {
    return _items;
  }

  List<Match> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFollow).toList();
  }

  Match findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addMatch(Match match) async {
    final newMatch = await _matchsService.addMatch(match);
    if(newMatch != null){
      _items.add(newMatch);
      notifyListeners();
    }
  }

  Future<void> updateMatch(Match match) async {
    final index = _items.indexWhere((item) =>item.id == match.id);
    if(index >= 0) {
      if(await _matchsService.updateMatch(match)){
        _items[index] = match;
        notifyListeners();
      }
    }
  }

  Future<void> deleteMatch(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Match? existingProducct = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if(!await _matchsService.deleteMatch(id)){
      _items.insert(index, existingProducct);
      notifyListeners();
    }
  }

  Future<void> toggleFavoriteStatus(Match match) async {
    final savedStatus = match.isFollow;
    match.isFollow = !savedStatus;

    if(!await _matchsService.saveFollowMatch(match)){
      match.isFollow = savedStatus;
    }
  }
}