import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/views/category_meals.screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  final String title;
  final Color color;
  final String id;

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoryMealsScreen(
    //       categoryTitle: this.title,
    //       categoryID: this.id,
    //     );
    //   }),
    //);
    Navigator.of(context).pushNamed( CategoryMealsScreen.routeName,
        arguments: {'id': this.id, 'title': this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
