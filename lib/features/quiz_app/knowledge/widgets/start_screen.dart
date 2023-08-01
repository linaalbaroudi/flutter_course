import 'package:flutter/material.dart';
import 'package:meals_app/utils/palette.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onPressed, {Key? key}) : super(key: key);

  final void Function() onPressed;

  Widget _image() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image.asset(
        "assets/images/quiz-logo.png",
        color: Colors.white.withOpacity(0.5),
        width: 300,
      ),
    );
  }

  Widget _startQuizButton(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Learn Flutter the fun way',
          style: Theme.of(ctx)
              .textTheme
              .displayMedium!
              .copyWith(color: Palette.white),
        ),
        SizedBox(
          height: 16,
        ),
        FittedBox(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: Text(
                    'Start Quiz',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var isVertical = MediaQuery.of(context).orientation;
    return isVertical == Orientation.portrait
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _image(),
              _startQuizButton(context),
            ],
          ),
        )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _image(),
              _startQuizButton(context),
            ],
          );
  }
}
