import 'package:flutter/material.dart';
import 'package:meals_app/features/todo_app/todo_item.widget.dart';
import 'package:meals_app/features/todo_app/todo_model.dart';

import '../components/drawer.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  Order _order = Order.asc;
  final List<ToDo> _todos = [
    const ToDo(title: "Learn Flutter", priority: Priority.doIt),
    const ToDo(title: "Clean the house", priority: Priority.delegate),
    const ToDo(title: "Play video games", priority: Priority.delete),
    const ToDo(title: "Finish side project", priority: Priority.schedule),
    const ToDo(title: "Work", priority: Priority.doIt),
    const ToDo(title: "Cook", priority: Priority.delegate),
    const ToDo(title: "Social Media", priority: Priority.delete),
    const ToDo(title: "Go to GYM", priority: Priority.schedule),
  ];

  List<ToDo> get _orderedToDos {
    final orderedList = List.of(_todos);
    orderedList.sort((a, b) {
      final bComesAfterA = a.priority.order.compareTo(b.priority.order);
      return _order == Order.asc ? bComesAfterA : -bComesAfterA;
    });
    return orderedList;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == Order.asc ? Order.desc : Order.asc;
    });
  }

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My ToDo List:", style: Theme.of(context).textTheme.headlineSmall),
                  IconButton(
                      onPressed: _changeOrder,
                      icon: _order == Order.asc
                          ? Icon(Icons.upload_outlined)
                          : Icon(Icons.download_outlined))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                // child: ListView.builder(
                //   itemBuilder: (context, index) => ToDoItem(
                //       key: ValueKey(_orderedToDos[index].title),
                //       to do: _orderedToDos[index]),
                //   itemCount: _orderedToDos.length,
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final todo in _orderedToDos)
                        ToDoItem(
                          key: ObjectKey(todo), // ValueKey()
                          todo: todo,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
