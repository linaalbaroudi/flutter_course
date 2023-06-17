import 'package:flutter/material.dart';
import 'package:meals_app/features/quiz_app/knowledge/widgets/answer_button.dart';
import '../models/question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.questions, required this.answerQuestion});

  final List<Question> questions;
  final void Function(String answer) answerQuestion;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  Question? question;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    question = widget.questions[currentQuestionIndex];
    super.initState();
  }

  void nextQuestion(String answer){
    widget.answerQuestion(answer);
    setState(() {
      currentQuestionIndex++;
      if(currentQuestionIndex < widget.questions.length){
        question = widget.questions[currentQuestionIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              question!.text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
          SizedBox(height: 16,),
          ...question!.getShuffeledAnswers().map((answer) {
            return AnswerButton(answer: answer, onPressed: (){
              nextQuestion(answer);
            },);
          })
        ],
      ),
    );
  }
}
