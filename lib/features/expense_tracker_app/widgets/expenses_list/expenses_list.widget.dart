import 'package:flutter/material.dart';
import 'package:meals_app/features/expense_tracker_app/widgets/expenses_list/expense_item.widget.dart';
import '../../models/Expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.deleteExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) deleteExpense;

  @override
  Widget build(BuildContext context) {


    if(expenses.isEmpty){
      return Center(
        child: Image.asset(
          "assets/images/empty.png",
          width: 200,
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (_) => deleteExpense(expenses[index]),
        child: ExpenseItem(
          icon: expenses[index].category.icon,
          title: expenses[index].title,
          date: expenses[index].formattedDate,
          amount: expenses[index].amount,
        ),
      ),
      itemCount: expenses.length,
    );
  }
}
