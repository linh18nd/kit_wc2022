import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/app.dart';
import 'package:kit_wc2022/src/data/models/football_match.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/presentation/module/home_screen/home_controller/home_bloc/home_bloc.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const MyApp(),
    ),
  );
}
