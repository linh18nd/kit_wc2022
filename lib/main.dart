import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/app.dart';
import 'package:kit_wc2022/src/models/football_match.dart';

void main(List<String> args) async {
  List<FootballMatch> footballMatchs = await fetchFootballMatch();

  runApp(MyApp(
    footballMatchs: footballMatchs,
  ));
}
