import 'package:flutter/material.dart';
import 'package:kit_wc2022/src/models/football_match.dart';
// ignore: depend_on_referenced_packages
import 'package:date_format/date_format.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});
  final FootballMatch match;

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
                child: Text(
                  'Group ${match.group.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatDate(match.localDate, [HH, ':', nn]),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' - ${match.localDate.day}/${match.localDate.month}/${match.localDate.year}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(match.homeFlag),
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
                          backgroundImage: NetworkImage(match.awayFlag),
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
