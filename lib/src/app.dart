import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/ui/screen/home_screen.dart';

import 'models/football_match.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.footballMatchs});
  final List<FootballMatch> footballMatchs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Home(
          footballMatchs: footballMatchs,
        ),
      ),
    );
  }
}
