import 'package:flutter/material.dart';

import 'dice_widget.dart';

const Alignment startAlignment = Alignment.bottomCenter;
const Alignment endAlignment = Alignment.topCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, required this.colors}) : super(key: key);

  GradientContainer.orange({super.key})
      : colors = [
          Color(0xff6c3e02),
          Color(0xffa65f03),
        ];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: colors,
        ),
      ),
      child: Dice(),
    );
  }
}
