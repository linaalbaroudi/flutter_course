import 'package:flutter/material.dart';
import 'package:meals_app/features/quiz_app/personal/views/widgets/quiz.widget.dart';
import 'package:meals_app/features/quiz_app/personal/views/widgets/result.widget.dart';

class PersonalQuizScreen extends StatefulWidget {
  const PersonalQuizScreen({Key? key}) : super(key: key);

  @override
  State<PersonalQuizScreen> createState() => _PersonalQuizScreenState();
}

class _PersonalQuizScreenState extends State<PersonalQuizScreen> {
  var _questions = [
    {
      "QuestionText": "What is Flutter?",
      "Answers": [
        {"text": "A programming language", "score": 0},
        {
          "text": "A framework for building native cross-platform apps",
          "score": 10
        },
        {"text": "I don't know !", "score": 1},
        {"text": "A toy :)", "score": 5},
      ],
    },
    {
      "QuestionText": "What programming language Flutter is based on?",
      "Answers": [
        {"text": "Dart", "score": 10},
        {"text": "Java", "score": 1},
        {"text": "Python", "score": 0},
        {"text": "C#", "score": 1},
      ],
    },
    {
      "QuestionText": "Do you like me?",
      "Answers": [
        {"text": "Yes !!", "score": 10},
        {"text": "No :P", "score": 5},
        {"text": "Who are you ?!!", "score": 1},
      ],
    },
    {
      "QuestionText": "Why?!",
      "Answers": [
        {"text": "Because I don't know you !", "score": 10},
        {"text": "You don't seem funny", "score": 0},
        {"text": "Because of the color of the sky", "score": 5},
        {"text": "Just because :P", "score": 1},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length) _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Personal Quiz"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion:
                    _answerQuestion, //TODO: passing only the function reference
              )
            : Result(resultScore: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
