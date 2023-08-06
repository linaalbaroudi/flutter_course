import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meals_app/features/expense_tracker_app/models/Expense.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key, required this.onSubmit});

  final void Function(Expense expense) onSubmit;

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.other;

  void _saveExpense() {
    final isNameInvalid = _nameController.text.trim().isEmpty;
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    final isDateInvalid = _selectedDate == null;
    if (isNameInvalid || isAmountInvalid || isDateInvalid) {
      _showDialog();
      return;
    }
    final Expense newExpense = Expense(
        title: _nameController.text,
        amount: double.parse(_amountController.text),
        date: _selectedDate!,
        category: _selectedCategory);
    print(newExpense.toString());
    widget.onSubmit(newExpense);
    Navigator.pop(context);
  }

  void _showDialog(){
    if(Platform.isIOS){
      showCupertinoDialog(context: context, builder: (ctx) => AlertDialog(
        title: Text("Invalid Input !"),
        content: Text("Please fill the missing fields"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"))
        ],
      ));
    }else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Invalid Input !"),
                content: Text("Please fill the missing fields"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ));
    }
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 336)),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
    // var date = await showDatePicker(
    //       context: context,
    //       initialDate: DateTime.now(),
    //       firstDate: DateTime.now().subtract(Duration(days: 336)),
    //       lastDate: DateTime.now(),
    //
    //     );
    // setState(() {
    //    _selectedDate = date!;
    // });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    print("keyboardHeight = $keyboardHeight");

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;
        final minHeight = constraints.minHeight;
        final minWidth = constraints.minWidth;
        print(
            "maxHeight: $maxHeight\nmaxWidth: $maxWidth\nminHeight: $minHeight\nminWidth: $minWidth");

        return Container(
          padding: EdgeInsets.only( top: 16, left: 16, right: 16, bottom: keyboardHeight + 16),
          height: maxHeight * 0.9,
          width: maxWidth * 0.95,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
                if (maxWidth >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          maxLength: 50,
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text(
                              "name",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(
                              "amount",
                            ),
                            prefix: Text("\$ "),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    maxLength: 50,
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: Text(
                        "name",
                      ),
                    ),
                  ),
                if (maxWidth >= 600)
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton(
                            value: _selectedCategory,
                            items: Category.values.map((category) => DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: [
                                    category.icon,
                                    Padding( padding: const EdgeInsets.only( left: 8.0, bottom: 13, top: 10, right: 16),
                                      child: Text(
                                        category.name,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? "Select Date"
                                  : DateFormat.yMd().format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _selectDate,
                              icon: Icon(Icons.date_range),
                            )
                          ],
                        ),
                      ),

                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(
                              "amount",
                            ),
                            prefix: Text("\$ "),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? "Select Date"
                                    : DateFormat.yMd().format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: _selectDate,
                                icon: Icon(Icons.date_range),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (maxWidth < 600)
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: [
                                        category.icon,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              bottom: 13,
                                              top: 10,
                                              right: 16),
                                          child: Text(
                                            category.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                      ElevatedButton(
                        onPressed: () => _saveExpense(),
                        child: Text("Add Expense"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
