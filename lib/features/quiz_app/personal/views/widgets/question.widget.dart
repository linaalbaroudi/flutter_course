import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
