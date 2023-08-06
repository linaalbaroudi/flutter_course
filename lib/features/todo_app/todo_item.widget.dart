import 'package:flutter/material.dart';
import 'package:meals_app/features/todo_app/todo_model.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {

  bool _isDone = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _isDone = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        // leading: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     _isDone ? Icon(Icons.task_alt) : Icon(Icons.circle_outlined),
        //   ],
        // ),
        leading: Checkbox(
          value: _isDone,
          onChanged: (value)=> _setDone(value),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            widget.todo.title,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: widget.todo.priority.color),
          child: Container(
            padding: EdgeInsets.only(top: 6, left: 8, right: 8),
            height: 36,
            child: Text("${widget.todo.priority.name}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
          ),
        ),
        // onTap: ()=> _setDone(!_isDone),
      ),
    );
  }
}
