import 'package:flutter/material.dart';
import 'package:meals_app/features/roll_dice/widgets/gradient_container.dart';

import '../../utils/palette.dart';

class RollDice extends StatelessWidget {
  const RollDice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Roll Dice"),
        ),
        //backgroundColor: Color.fromRGBO(18, 4, 37, 1.0),
        body: //GradientContainer.orange(),
        GradientContainer(
          colors: [
            Palette.darkPurple,
            Palette.purple,
          ],
        ),
      ),
    );
  }
}
