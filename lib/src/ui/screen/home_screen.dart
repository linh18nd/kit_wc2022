import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/match_card.dart';

import '../../models/football_team.dart';

FootballMatch footballMatch = FootballMatch(
  id: '1',
  group: Groups.A,
  homeTeamId: '1',
  awayTeamId: '2',
  homeScore: 1,
  awayScore: 2,
  localDate: DateTime.now(),
  timeElapsed: 'NoStart',
  finished: 'true',
  matchday: '1',
  homeTeamEn: 'Russia',
  awayTeamEn: 'Saudi Arabia',
  homeFlag:
      'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png',
  awayFlag:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/1200px-Flag_of_Saudi_Arabia.svg.png',
);

class Home extends StatelessWidget {
  const Home({super.key, required this.footballMatchs});
  final List<FootballMatch> footballMatchs;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListView.builder(
          itemCount: footballMatchs.length,
          itemBuilder: (context, index) {
            return MatchCard(
              match: footballMatchs[index],
            );
          }),
    );
  }
}
