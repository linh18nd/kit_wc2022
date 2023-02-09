import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kit_wc2022/src/data/models/football_match.dart';
// ignore: depend_on_referenced_packages
import 'package:date_format/date_format.dart';

import 'home_body.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MatchDetails(match: match)));
      },
      child: SizedBox(
        height: 200.h,
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
            borderRadius: BorderRadius.circular(30.0.sp),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Text('Group ${match.group}',
                      style: Theme.of(context).textTheme.headline4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formatDate(match.localDate, [HH, ':', nn]),
                        style: Theme.of(context).textTheme.headline5),
                    isAllDay
                        ? Text(
                            ' - ${match.localDate.day}/${match.localDate.month}/${match.localDate.year}',
                            style: Theme.of(context).textTheme.headline5)
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            match.homeTeamEn,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('${match.homeScore} : ${match.awayScore}',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: match.homeScore > match.awayScore
                                      ? Colors.green
                                      : match.homeScore < match.awayScore
                                          ? Colors.red
                                          : Colors.black)),
                          Text(
                            match.timeElapsed,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundImage: NetworkImage(match.awayFlag == ''
                                ? 'https://tiengdong.com/wp-content/uploads/www_tiengdong_com-hinh-anh-dang-load-dang-tai-troll-mang-cham.jpeg'
                                : match.awayFlag),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            match.awayTeamEn,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
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
      ),
    );
  }
}
