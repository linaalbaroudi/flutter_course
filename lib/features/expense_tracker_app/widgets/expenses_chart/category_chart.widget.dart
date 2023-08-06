import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/Expense.dart';
import '../../models/Expense.dart';
import 'chart_bar.widget.dart';

class CategoryChart extends StatelessWidget {
  CategoryChart({Key? key, required this.expensesList}) : super(key: key);

  final List<Expense> expensesList;

  double get weekSpending{
    return groupedExpenses.fold(0.0, (sum, element){
      return sum + (element['amount'] as double) ;
    });
  }

  List<Map<String, Object>> get groupedExpenses {
    return List.generate(Category.values.length, (index) {
      //for each category
      final Category category = Category.values[index];

      //find the total amount of spending in each category
      double totalAmount = 0;
      for (Expense expense in expensesList) {
        if (expense.category == category) {
          totalAmount += expense.amount;
        }
      }

      return {'category': category, 'amount': totalAmount};
    }).toList();
  }

  List<ExpenseBucket> get buckets{
    return List.generate(Category.values.length, (index){
      return ExpenseBucket.forCategory(expensesList, Category.values[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: groupedExpenses.map((element) => ChartBar(
          //   axis: Padding(
          //     padding: EdgeInsets.only(bottom: 8),
          //     child: (element['category'] as Category).icon,
          //   ),
          //   amount: element['amount'] as double,
          //   ratio: weekSpending <= 0 ? 0.0 : (element['amount'] as double)/weekSpending,
          // ),
          // ).toList(),
          children: buckets.map((element) => ChartBar(
            axis: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: element.category.icon,
            ),
            amount: element.totalExpenses,
            ratio: weekSpending <= 0 ? 0.0 : element.totalExpenses/weekSpending,
          ),
          ).toList(),
        ),
      ),
    );
  }
}