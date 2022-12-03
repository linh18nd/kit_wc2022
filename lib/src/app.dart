import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/ui/components/custom_app_bar.dart';

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
          headline6: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          headline5: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline4: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          headline3: const TextStyle(
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
