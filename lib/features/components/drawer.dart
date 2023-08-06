import 'package:flutter/material.dart';
import 'package:meals_app/features/quiz_app/knowledge/knowledge_quiz_screen.dart';
import 'package:meals_app/features/quiz_app/personal/views/personal_quiz.screen.dart';
import '../expense_tracker_app/expences.screen.dart';
import '../roll_dice/roll_dice.screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Apps",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.gamepad,
              ),
              title: Text("Roll Dice",
                  style: Theme.of(context).textTheme.headlineMedium),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RollDice(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ExpansionTile(
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.quiz,
                  ),
                  SizedBox(
                    width: 178,
                    child: Text(
                      "Quiz App",
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                        fontWeight: Theme.of(context).textTheme.headlineMedium!.fontWeight,
                      )
                    ),
                  ),
                ],
              ),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                  ),
                  title: Text("Personal Quiz",
                      style: Theme.of(context).textTheme.headlineMedium),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PersonalQuizScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.flutter_dash,
                  ),
                  title: Text("Knowledge Quiz",
                      style: Theme.of(context).textTheme.headlineMedium),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const KnowledgeQuizScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
              ),
              title: Text("Expenses Tracker",
                  style: Theme.of(context).textTheme.headlineMedium),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ExpensesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
