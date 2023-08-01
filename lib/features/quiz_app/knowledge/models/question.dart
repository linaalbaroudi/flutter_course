class Question{
  final String text;
  final List<String> answers;

  const Question({required this.text, required this.answers});
  //const Question(this.text,this.answers, this.answerIndex);

  List<String> get shuffledAnswers{
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}