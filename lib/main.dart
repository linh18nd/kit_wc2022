import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/app.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_wc2022/src/wc_bloc/bloc.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (context) => WCBloc(),
      child: const MyApp(),
    ),
  );
}
