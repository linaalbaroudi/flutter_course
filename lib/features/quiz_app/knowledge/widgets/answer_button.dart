import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onPressed});

  final String answer;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(answer,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
