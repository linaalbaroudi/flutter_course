import 'package:flutter/material.dart';

class ToDo{
  final String title;
  final Priority priority;

  const ToDo({required this.title, required this.priority});
}

enum Order{
  asc,
  desc
}

enum Priority{
  doIt(isUrgent: true, isImportant: true, order: 1, color: Colors.green),
  schedule(isUrgent: false, isImportant: true, order: 2, color: Colors.blue),
  delegate(isUrgent: true, isImportant: false, order: 3, color: Colors.orange),
  delete(isUrgent: false, isImportant: false, order: 4, color: Colors.redAccent);

  final bool isUrgent;
  final bool isImportant;
  final int order;
  final Color color;

  const Priority({required this.isImportant, required this.isUrgent, required this.order, required this.color});
}