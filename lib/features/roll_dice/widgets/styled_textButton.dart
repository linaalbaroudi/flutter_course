import 'package:flutter/material.dart';

class StyledTextButton extends StatelessWidget {
  const StyledTextButton(this.text, {Key? key, required this.onPressed}) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        //style: Theme.of(context).textTheme.displayLarge,
      ),
      onPressed: onPressed,
    );
  }
}
