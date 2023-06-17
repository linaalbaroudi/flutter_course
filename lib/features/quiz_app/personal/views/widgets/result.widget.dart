import 'package:flutter/material.dart';
import 'package:meals_app/utils/palette.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.resultScore, required this.resetQuiz})
      : super(key: key);

  final int resultScore;
  final VoidCallback resetQuiz;

  //getter
  String get resultPhrase {
    if (resultScore < 15) {
      return "The sky is purple";
    } else if (resultScore < 30) {
      return "I like you P9";
    } else {
      return "You Did It !!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Score: $resultScore",
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            "$resultPhrase",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: resetQuiz,
            icon: Icon(Icons.restart_alt),
            iconSize: 75,
            color: Palette.purple,
            // style: IconButton.styleFrom(
            //   backgroundColor: Palette.lightGray,
            //   foregroundColor: Palette.purple,
            //   iconSize: 100,
            // ),
          )
        ],
      ),
    );
  }
}
