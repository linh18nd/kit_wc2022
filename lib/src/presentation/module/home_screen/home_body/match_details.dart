import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/data/models/football_match.dart';
import 'package:date_format/date_format.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({super.key, required this.match});
  final FootballMatch match;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
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
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 158, 232, 128),
                    Color.fromARGB(255, 191, 206, 241),
                    Color.fromARGB(255, 241, 191, 240),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/image/logo_wc.png',
                      width: 300,
                      // height: 50,
                    ),
                  ),
                  Center(
                    child: Text('Group ${match.group}',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  const Divider(
                    color: Color.fromARGB(199, 247, 131, 36),
                    thickness: 4,
                    endIndent: 30,
                    indent: 30,
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
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '${match.homeScore} : ${match.awayScore}',
                              style: Theme.of(context).textTheme.headline3,
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
                              style: Theme.of(context).textTheme.headline5,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromARGB(197, 168, 40, 140),
                    thickness: 3,
                    endIndent: 60,
                    indent: 60,
                  ),
                  Text(
                    match.timeElapsed == ''
                        ? 'Match not started'
                        : 'Time elapsed: ${match.timeElapsed}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                      '${match.localDate.day}/${match.localDate.month}/${match.localDate.year}',
                      style: Theme.of(context).textTheme.headline5),
                  Text(formatDate(match.localDate, [HH, ':', nn]),
                      style: Theme.of(context).textTheme.headline5),
                  Expanded(
                    child: Card(
                        elevation: 5,
                        shadowColor: const Color.fromARGB(255, 213, 114, 173),
                        margin: const EdgeInsets.all(10),
                        color: const Color.fromARGB(126, 191, 241, 237),
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'assets/image/ball.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Text(
                                    match.homeScorers == 'null'
                                        ? 'No Data'
                                        : match.homeScorers
                                            .toString()
                                            .replaceAll(',', '\n'),
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                    //maxLines: 6,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'assets/image/wc_cup.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'assets/image/ball.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Text(
                                    match.awayScorers == 'null'
                                        ? 'No Data'
                                        : match.awayScorers
                                            .toString()
                                            .replaceAll(',', '\n'),
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                    //maxLines: 6,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(41, 0, 187, 255),
            elevation: 10,
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
