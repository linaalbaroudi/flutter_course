import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/meal_detail_screen';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget buildListContainer(BuildContext context, Widget list) {
    return Container(
      height: 200,
      width: 325,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final mealId = routeArgs;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildListContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Colors.white12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildListContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
