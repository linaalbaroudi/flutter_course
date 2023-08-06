import 'package:flutter/material.dart';
import 'package:meals_app/app_theme.dart';
import 'package:meals_app/features/todo_app/todo.screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp
  // ]).then((value) => runApp(MyApp())
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      theme: AppTheme.light(),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.dark(),
      //home: CategoriesScreen(),
      routes:{
        '/' : (ctx) => ToDoApp(),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => ToDoApp());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => ToDoApp());
      },
    );
  }
}
