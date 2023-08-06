import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key, required this.axis, required this.amount, required this.ratio})
      : super(key: key);

  final Widget axis;
  final double amount;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child:
                FittedBox(child: Text("\$${amount.toStringAsFixed(0)}"))),
            Expanded(
              flex: 5,
              child: Container(
                width: 16,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Palette.lightGray,
                      ),
                    ),
                    Positioned(
                      child: FractionallySizedBox(
                        heightFactor: ratio,
                        child: Container(
                          //height:
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: axis
            ),
          ],
        ),
      ),
    );
  }
}