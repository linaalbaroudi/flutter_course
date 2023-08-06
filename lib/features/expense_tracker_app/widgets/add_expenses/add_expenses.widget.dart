import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meals_app/features/expense_tracker_app/models/Expense.dart';
import 'package:meals_app/utils/palette.dart';

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
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
            TextField(
              maxLength: 50,
              controller: _nameController,
              decoration: InputDecoration(
                label: Text(
                  "name",
                ),
              ),
            ),
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
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 13, top:10, right: 16),
                                    child: Text(category.name, style: Theme.of(context).textTheme.bodyMedium,),
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
  }
}
