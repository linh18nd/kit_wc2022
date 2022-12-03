import 'package:flutter/material.dart';

class NoMatch extends StatelessWidget {
  const NoMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/football_award.png',
            width: 200,
            height: 200,
          ),
          const Text(
            'No match found',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Try another time',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
