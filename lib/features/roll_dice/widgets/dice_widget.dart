import 'package:flutter/material.dart';
import 'package:meals_app/features/roll_dice/widgets/styled_textButton.dart';
import 'dart:math';

final random = Random();

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  var activeImage = "assets/images/dice-images/dice-1.png";
  int index = 1;

  void rollDice(){
    setState(() {
      index = random.nextInt(6) +1;
      print(index);
      activeImage = "assets/images/dice-images/dice-$index.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            activeImage,
            width: 200,
          ),
          const SizedBox(height: 8,),
          StyledTextButton("Roll Dice !", onPressed: rollDice),
        ],
      ),
    );
  }
}
