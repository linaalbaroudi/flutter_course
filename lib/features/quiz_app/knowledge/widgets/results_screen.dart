import 'package:flutter/material.dart';
import 'package:meals_app/features/quiz_app/knowledge/widgets/question_result.dart';
import 'package:meals_app/features/quiz_app/knowledge/models/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.answers, required this.questions, required this.onRestart});

  final List<String> answers;
  final List<Question> questions;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> data = [];
    for (var i = 0; i < answers.length; i++) {
      data.add({
        'index': i+1,
        'question': questions[i],
        'answer': questions[i].answers[0], // correct answer is always at index 0
        'userAnswer': answers[i],
        'isCorrect': questions[i].answers[0] == answers[i], // correct answer is always at index 0
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numCorrectAnswers = summary.where((element) => element['isCorrect'] as bool).length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "You have answered $numCorrectAnswers out of ${questions.length} questions correctly!",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: getSummaryData().length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: QuestionResult(
                  questionSummary: summary[index],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: 170,
                child: ElevatedButton(
                  onPressed: onRestart,
                  child: FittedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.replay),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Text(
                            'Restart Quiz',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
