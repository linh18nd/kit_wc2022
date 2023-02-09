import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/data/models/football_match.dart';
import 'package:kit_wc2022/src/presentation/components/components.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_body/choose_time.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_body/match_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_body/no_match.dart';
import 'package:kit_wc2022/src/common/uitls/constants.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_controller/home_controller_export.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_controller/home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<HomeBloc, WCState>(
        builder: (context, state) {
          return PageView.builder(
            controller: PageController(
              initialPage: kWCTime.indexOf(state.time),
            ),
            onPageChanged: (value) {
              context
                  .read<HomeBloc>()
                  .add(WCEventTimeChanged(time: kWCTime[value]));
            },
            itemCount: kWCTime.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: state.footballMatchs.isEmpty
                  ? const NoMatch()
                  : ListView.builder(
                      itemCount: state.footballMatchs.length,
                      itemBuilder: (context, index) {
                        return MatchCard(
                          isAllDay: state.time == 'All',
                          match: state.footballMatchs[index],
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
