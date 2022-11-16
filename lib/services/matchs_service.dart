import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/match.dart';
import '../models/auth_token.dart';

import 'firebase_service.dart';

class MatchsService extends FirebaseService {
  MatchsService([AuthToken? authToken]) : super(authToken);
  
  Future<List<Match>> fetchMatchs() async {
    final List<Match> matchs = [];
    final prefs = await SharedPreferences.getInstance();
    final String? _token = prefs.getString('token');
    final String? email = prefs.getString('email');
    final String? idUser = prefs.getString('idUser');

    try {
      // final filters = filterByUser ? 'orderBy="creatorId"&equalto="$userId"':'';
      final matchsUrl = Uri.parse('$databaseUrl/matchs.json?auth=$_token');
      final response = await http.get(matchsUrl);
      final matchsMap = json.decode(response.body) as Map<String, dynamic>;
      if(response.statusCode != 200){
        print(matchsMap['error']);
        return matchs;
      }

      final userFollowUrl = Uri.parse('$databaseUrl/followMatch/$idUser.json?auth=$_token');
      final userFollowResponse = await http.get(userFollowUrl);
      final userFavoritesMap = json.decode(userFollowResponse.body);
      matchsMap.forEach((matchId, match) {
        final isFollow = (userFavoritesMap == null)
          ? false
          : (userFavoritesMap[matchId] ?? false);
        matchs.add(  
          Match.fromJson({
            'id': matchId,
            ...match,
          }).copyWith(isFollow: isFollow),
        );
      });
      return matchs;
    }catch (error){
      print(error);
      return matchs;
    }
  }

  Future<Match?> addMatch(Match match) async {
    try {
      final url = Uri.parse('$databaseUrl/matchs.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(   
          match.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );

      if(response.statusCode != 200){
        throw Exception(json.decode(response.body)['error']);
      }

      return match.copyWith(
        id: json.decode(response.body)['name'],
      );
    }catch(error){
      print(error);
      return null;
    }
  }

  Future<bool> updateMatch(Match match) async {
    try {
      final url = Uri.parse('$databaseUrl/matchs/${match.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(match.toJson()),
      );
      if (response.statusCode != 200){
        throw Exception(json.decode(response.body)['error']);
      }

      return true;
    }catch(error){
      print(error);
      return false;
    }
  }

  Future<bool> deleteMatch(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/matchs/$id.json?auth=$token');
      final response = await http.delete(url);

      if(response.statusCode != 200){
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    }catch(error){
      print(error);
      return false;
    }
  }

  Future<bool> saveFollowMatch(Match match) async {
    final prefs = await SharedPreferences.getInstance();
    final String? _token = prefs.getString('token');
    final String? idUser = prefs.getString('idUser');

    try {
      final url = Uri.parse(  
        '$databaseUrl/followMatch/$idUser/${match.id}.json?auth=$_token'
      );
      final response = await http.put(  
        url,
        body: json.encode(  
        match.isFollow,
        ),
      );

      if(response.statusCode != 200){
        throw Exception(json.decode(response.body)['error']);
      }

      return true;
    }catch(error){
      print(error);
      return false;
    }
  }
}