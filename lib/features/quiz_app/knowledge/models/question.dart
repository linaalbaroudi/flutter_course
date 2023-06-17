class Question{
  final String text;
  final List<String> answers;

  const Question({required this.text, required this.answers});
  //const Question(this.text,this.answers, this.answerIndex);

  List<String> getShuffeledAnswers(){
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}