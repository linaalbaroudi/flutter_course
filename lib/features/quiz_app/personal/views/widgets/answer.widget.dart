import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.answer, required this.answerQuestion}) : super(key: key);

  final String answer;
  final VoidCallback answerQuestion; //Function => VoidCallback (if it does not receives input or returns anything)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: answerQuestion,
        child: Text(answer),
      ),
    );
  }
}
