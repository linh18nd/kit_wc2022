import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
// ignore: depend_on_referenced_packages
import 'package:date_format/date_format.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
    required this.match,
    this.isAllDay = false,
  });
  final FootballMatch match;
  final bool isAllDay;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        surfaceTintColor: Colors.amber,
        //semanticContainer: false,
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 142, 213, 114),
        margin: const EdgeInsets.all(10),
        color: const Color.fromARGB(126, 191, 241, 237),
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Text('Group ${match.group}',
                    style: Theme.of(context).textTheme.headline6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(formatDate(match.localDate, [HH, ':', nn]),
                      style: Theme.of(context).textTheme.headline6),
                  isAllDay
                      ? Text(
                          ' - ${match.localDate.day}/${match.localDate.month}/${match.localDate.year}',
                          style: Theme.of(context).textTheme.headline6)
                      : const SizedBox(),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(match.homeFlag == ''
                              ? 'https://tiengdong.com/wp-content/uploads/www_tiengdong_com-hinh-anh-dang-load-dang-tai-troll-mang-cham.jpeg'
                              : match.homeFlag),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          match.homeTeamEn,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${match.homeScore} : ${match.awayScore}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          match.timeElapsed,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(match.awayFlag == ''
                              ? 'https://tiengdong.com/wp-content/uploads/www_tiengdong_com-hinh-anh-dang-load-dang-tai-troll-mang-cham.jpeg'
                              : match.awayFlag),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          match.awayTeamEn,
                          style: Theme.of(context).textTheme.headlineSmall,
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
