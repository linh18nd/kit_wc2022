import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_wc2022/src/data/models/football_match.dart';
import 'package:kit_wc2022/src/common/uitls/constants.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_controller/home_controller_export.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class HomeBloc extends Bloc<WCEvent, WCState> {
  HomeBloc()
      : super(WCStateLoading('${DateTime.now().day}/${DateTime.now().month}')) {
    getWC();
    on<WCEventTimeChanged>(onFilter);
  }

  Future<void> getWC() async {
    var maskWidget = const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Opacity(
        opacity: 0.6,
        // child: Image.network(
        //   'https://tophinhanh.com/wp-content/uploads/2021/12/16_hinh-meo-ngau-nhat-vinh-bac-bo-sieu-cute.jpg',
        //   fit: BoxFit.fill,
        // ),
      ),
    );
    SmartDialog.showLoading(maskWidget: maskWidget);
    List<FootballMatch> footballMatchs = await fetchFootballMatch();
    SmartDialog.dismiss();
    emit(WCState(
        footballMatchs: footballMatchs,
        time: '${DateTime.now().day}/${DateTime.now().month}'));
  }

  FutureOr<void> onFilter(
      WCEventTimeChanged event, Emitter<WCState> emit) async {
    emit(WCStateLoading(event.time));
    var maskWidget = SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Opacity(
        opacity: 0.6,
        child: Container(
          color: const Color.fromARGB(72, 130, 123, 123),
        ),
        // child: Image.network(
        //   'https://tophinhanh.com/wp-content/uploads/2021/12/16_hinh-meo-ngau-nhat-vinh-bac-bo-sieu-cute.jpg',
        //   fit: BoxFit.fill,
        // ),
      ),
    );
    SmartDialog.showLoading(maskWidget: maskWidget);
    List<FootballMatch> footballMatchs = await fetchFootballMatch();
    SmartDialog.dismiss();
    if (event.time == 'All') {
      emit(WCState(footballMatchs: footballMatchs, time: event.time));
    } else {
      List<FootballMatch> footballMatchsFilter = footballMatchs
          .where(
              // ignore: unrelated_type_equality_checks
              (element) => (element.localDate.day.toString() ==
                      event.time.split('/')[0] &&
                  // ignore: unrelated_type_equality_checks
                  element.localDate.month.toString() ==
                      event.time.split('/')[1]))
          .toList();

      emit(WCState(footballMatchs: footballMatchsFilter, time: event.time));
    }
  }
}
