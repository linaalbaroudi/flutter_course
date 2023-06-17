import 'package:flutter/material.dart';
import 'package:meals_app/app_theme.dart';
import 'package:meals_app/features/categories/views/categories.screen.dart';
import 'package:meals_app/features/categories/views/category_meals.screen.dart';
import 'package:meals_app/features/categories/views/meal_datail.screen.dart';
import 'package:meals_app/tabs.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: AppTheme.light(),
      //home: CategoriesScreen(),
      routes:{
        '/' : (ctx) => TabsScreen(),
        //'/category_meals_screen': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName : (ctx) => MealDetailsScreen(),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
