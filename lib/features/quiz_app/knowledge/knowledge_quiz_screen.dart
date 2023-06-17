import 'package:flutter/material.dart';
import 'package:meals_app/features/quiz_app/knowledge/models/question.dart';
import 'package:meals_app/features/quiz_app/knowledge/widgets/questions_screen.dart';
import 'package:meals_app/features/quiz_app/knowledge/widgets/results_screen.dart';
import 'package:meals_app/features/quiz_app/knowledge/widgets/start_screen.dart';
import 'package:meals_app/utils/palette.dart';
import 'models/questions_data.dart' as data;

class KnowledgeQuizScreen extends StatefulWidget {
  const KnowledgeQuizScreen({Key? key}) : super(key: key);

  @override
  State<KnowledgeQuizScreen> createState() => _KnowledgeQuizScreenState();
}

class _KnowledgeQuizScreenState extends State<KnowledgeQuizScreen> {

  Widget? activeScreen ;
  List<Question> questions = data.questionsList;
  List<String> userAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(questions: questions, answerQuestion: answerQuestions);
    });
  }

  void answerQuestions(String answer){
    userAnswers.add(answer);
    print("answers = ${userAnswers.length}, questions = ${questions.length}");
    if(userAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(answers: userAnswers, questions: questions, onRestart: restartQuiz,);
        userAnswers = [];
      });
    }
  }

  void restartQuiz(){
    setState(() {
      userAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Knowledge Quiz "),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Palette.darkPurple,
              Palette.purple
            ],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
