import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
import 'package:kit_wc2022/src/ui/components/custom_app_bar.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/choose_time.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/match_details.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/no_match.dart';
import 'package:kit_wc2022/src/ui/screen/home_screen.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const Scaffold(
        appBar: CustomAppBar(),
        body: Home(),
      ),
      navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
    );
  }
}
