import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/choose_time.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/match_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_wc2022/src/ui/screen/home_body/no_match.dart';
import 'package:kit_wc2022/src/ui/uitls/constants.dart';
import 'package:kit_wc2022/src/wc_bloc/bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WCBloc, WCState>(
      builder: (context, state) {
        return PageView.builder(
          controller: PageController(
            initialPage: kWCTime.indexOf(state.time),
          ),
          onPageChanged: (value) {
            context
                .read<WCBloc>()
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
    );
  }
}
