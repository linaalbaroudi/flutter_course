import 'package:flutter/material.dart';
import 'package:meals_app/features/expense_tracker_app/widgets/add_expenses/add_expenses.widget.dart';
import 'package:meals_app/features/expense_tracker_app/widgets/expenses_chart/category_chart.widget.dart';
import 'package:meals_app/features/expense_tracker_app/widgets/expenses_chart/date_chart.widget.dart';
import 'package:meals_app/features/expense_tracker_app/widgets/expenses_list/expenses_list.widget.dart';
import '../components/snackbar.dart';
import 'models/Expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
        title: "toy",
        amount: 200,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "grocery",
        amount: 55,
        date: DateTime.now(),
        category: Category.food),
    // Expense(
    //     title: "hotel reservation",
    //     amount: 600,
    //     date: DateTime.now(),
    //     category: Category.travel),
    // Expense(
    //     title: "online course",
    //     amount: 30,
    //     date: DateTime.now(),
    //     category: Category.work),
    // Expense(
    //     title: "coffee",
    //     amount: 5,
    //     date: DateTime.now(),
    //     category: Category.food),
    // Expense(
    //     title: "coffee coffee coffee coffee coffee coffee coffee coffee",
    //     amount: 5,
    //     date: DateTime.now(),
    //     category: Category.other),
  ];

  final List<bool> _selectedChart = <bool>[true, false];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => AddExpenses(onSubmit: _addExpense),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar().infoSnackBar(context,  "Expense deleted !", (){
          setState(() {
            _expenses.insert(expenseIndex, expense);
          });
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleButtons(
                      children: [
                        SizedBox(
                          width: 105,
                          child: Text("By Date", textAlign: TextAlign.center),
                        ),
                        SizedBox(
                          width: 105,
                          child: Text("By Category", textAlign: TextAlign.center),
                        )
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedChart.length; i++) {
                            _selectedChart[i] = i == index;
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      // selectedBorderColor: Colors.red[700],
                      // selectedColor: Colors.white,
                      // fillColor: Colors.red[200],
                      // color: Colors.red[400],
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedChart,
                  ),
                ],
              ),
              _selectedChart[0] ? DateChart(latestTransactions: _expenses) : CategoryChart(expensesList: _expenses),
              Expanded(
                  child: ExpensesList(
                expenses: _expenses,
                deleteExpense: _deleteExpense,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
