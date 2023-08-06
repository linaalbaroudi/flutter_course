import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:meals_app/utils/palette.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMd();

enum Category {
  food(icon: Icon(Icons.fastfood), color: Palette.food),
  leisure(icon: Icon(Icons.toys), color: Palette.leisure),
  travel(icon: Icon(Icons.airplanemode_active), color: Palette.travel),
  work(icon: Icon(Icons.work), color: Palette.work),
  other(icon: Icon(Icons.monetization_on), color: Palette.other);

  final Icon icon;
  final Color color;

  const Category({
    required this.icon,
    required this.color,
  });
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({required this.title,
    required this.amount,
    required this.date,
    required this.category})
      : id = uuid.v4();

  String get formattedDate => dateFormat.format(date);

  @override
  String toString() {
    return "id: $id, title: $title, amount: $amount, date: $formattedDate, category: ${category
        .name}";
  }
}

class ExpenseBucket {
  Category category;
  List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (Expense i in expenses) {
      sum += i.amount;
    }
    return sum;
  }
}
