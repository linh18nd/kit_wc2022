import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
import 'package:date_format/date_format.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({super.key, required this.match});
  final FootballMatch match;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              Center(
                child: Text('Group ${match.group}',
                    style: Theme.of(context).textTheme.headline6),
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
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                  '${match.localDate.day}/${match.localDate.month}/${match.localDate.year}',
                  style: Theme.of(context).textTheme.headline6),
              Text(formatDate(match.localDate, [HH, ':', nn]),
                  style: Theme.of(context).textTheme.headline6),
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
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
