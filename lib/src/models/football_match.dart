import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_team.dart';
import 'package:http/http.dart' as http;
import 'package:kit_wc2022/src/models/user.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class FootballMatch {
  final String id;
  final String group;
  final String homeTeamId;
  final String awayTeamId;
  final int homeScore;
  final int awayScore;
  final DateTime localDate;
  final String timeElapsed;
  final String finished;
  final String matchday;
  final String homeTeamEn;
  final String awayTeamEn;
  final String homeFlag;
  final String awayFlag;
  FootballMatch({
    required this.id,
    required this.group,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.homeScore,
    required this.awayScore,
    required this.localDate,
    required this.timeElapsed,
    required this.finished,
    required this.matchday,
    required this.homeTeamEn,
    required this.awayTeamEn,
    required this.homeFlag,
    required this.awayFlag,
  });
  factory FootballMatch.fromJson(Map<String, dynamic> json) {
    return FootballMatch(
      id: json['id'] as String,
      group: json['group'] as String,
      homeTeamId: json['home_team_id'] as String,
      awayTeamId: json['away_team_id'] as String,
      homeScore: json['home_score'] as int,
      awayScore: json['away_score'] as int,
      //11/21/2022 19:00int year,
      // [int month = 1,
      // int day = 1,
      // int hour = 0,
      // int minute = 0,
      // int second = 0,
      // int millisecond = 0,
      // int microsecond = 0
      localDate: DateTime(
          int.parse(json['local_date'].toString().split('/')[2].split(' ')[0]),
          int.parse(json['local_date'].toString().split('/')[0]),
          int.parse(json['local_date'].toString().split('/')[1]),
          int.parse(json['local_date'].toString().split(' ')[1].split(':')[0]),
          int.parse(json['local_date'].toString().split(' ')[1].split(':')[1])),

      timeElapsed: json['time_elapsed'] as String,
      finished: json['finished'] as String,
      matchday: json['matchday'] as String,
      homeTeamEn: json['home_team_en'] as String,
      awayTeamEn: json['away_team_en'] as String,
      homeFlag: json['home_flag'] as String,
      awayFlag: json['away_flag'] as String,
    );
  }
}

// curl --location --request GET 'http://api.cup2022.ir/api/v1/match' \
// --header 'Authorization: Bearer <token>' \
// --header 'Content-Type: application/json' \
Future<List<FootballMatch>> fetchFootballMatch() async {
  try {
    final String token = await login();
    final response = await http.get(
      Uri.parse('http://api.cup2022.ir/api/v1/match'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return getFootballMatch(response.body);
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

List<FootballMatch> getFootballMatch(String responseBody) {
  final parsed = jsonDecode(responseBody);
  final footballMatchs = parsed['data'] as List<dynamic>;
  return footballMatchs
      .map((footballMatch) => FootballMatch.fromJson(footballMatch))
      .toList();
}

Map<String, String> getFootballMatchMap(String responseBody) {
  final data = getData(jsonDecode(responseBody));
  final parsed = jsonDecode(data);
  return parsed
      .map<FootballMatch>((json) => FootballMatch.fromJson(json))
      .toList();
}

String getData(Map<String, dynamic> json) {
  return json['data'] as String;
}
