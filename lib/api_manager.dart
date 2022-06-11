import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart';
import 'package:real_football/soccermodel.dart';

class SoccerApi{
  final String apiUrl= "https://v3.football.api-sports.io/fixtures?live=all";
  
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "a41056a7b2a711c8d23cfd9f5b6c767c"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;
    
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
      
    }
      return getAllMatches();
  }
}
