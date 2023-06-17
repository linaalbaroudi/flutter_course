import 'package:flutter/material.dart';
import 'answer.widget.dart';
import 'question.widget.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key, required this.questions, required this.answerQuestion, required this.questionIndex}) : super(key: key);

  final List<Map<String, Object>> questions;
  final Function answerQuestion; //Function => VoidCallback (if it does not receives input or returns anything)
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Question:",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 8,),
          Question(
              question: questions[questionIndex]["QuestionText"] as String
          ),
          const SizedBox(height: 8,),
          ...( questions[questionIndex]['Answers'] as List<Map<String, Object>>).map((answer) {
            return Answer(
                answer: answer['text'] as String,
                answerQuestion: () => answerQuestion(answer['score']));
          }).toList(),
        ],
      ),
    );
  }
}