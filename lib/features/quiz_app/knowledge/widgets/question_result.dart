import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(
      {super.key,
      required this.questionSummary,});

  final Map<String, Object> questionSummary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          '${questionSummary['index']}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor:
        questionSummary['isCorrect'] as bool ? Colors.green.withOpacity(0.6) : Colors.red.withOpacity(0.6),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          '${questionSummary['question']}',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white,),
        ),
      ),
      subtitle: questionSummary['isCorrect'] as bool
          ? Text(
              "${questionSummary['userAnswer']}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.green),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${questionSummary['userAnswer']}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.red),
                ),
                Text(
                  "${questionSummary['answer']}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.green),
                ),
              ],
            ),
    );
  }
}
