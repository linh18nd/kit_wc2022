import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:kit_wc2022/src/common/uitls/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_wc2022/src/presentation/module/home_screen/home_controller/home_bloc/home_bloc.dart';
import '../home_controller/home_controller_export.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ChooseTimeBar extends StatelessWidget {
  const ChooseTimeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final constroller = ScrollController();

    return BlocBuilder<HomeBloc, WCState>(
      builder: (context, state) {
        return ChipsChoice<int>.single(
            scrollToSelectedOnChanged: true,
            //choiceCheckmark: true,
            scrollPhysics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            scrollController: constroller,
            wrapped: false,
            value: kWCTime.indexOf(state.time),
            onChanged: (value) async {
              context
                  .read<HomeBloc>()
                  .add(WCEventTimeChanged(time: kWCTime[value]));
            },
            choiceItems: C2Choice.listFrom<int, String>(
              source: kWCTime,
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceStyle: C2ChipStyle.filled(
                foregroundStyle: const TextStyle(fontSize: 20),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                selectedStyle: C2ChipStyle.filled()));
      },
    );
  }
}
