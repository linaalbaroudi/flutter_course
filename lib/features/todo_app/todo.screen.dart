import 'package:flutter/material.dart';

import '../components/drawer.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Course"),
        ),
        drawer: Drawer(
          child: CustomDrawer(),
        ),

        body: Text("todo"),
      ),
    );
  }
}
