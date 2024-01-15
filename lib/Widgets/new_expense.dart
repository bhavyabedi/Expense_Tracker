import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _showDatePicker() async {
    //Pops Up the Date Picker in the Modal Pop Up
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    var pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitValidate() {
    final selectedAmount = double.tryParse(_amountController.text);
    final isInvalid = selectedAmount == null || selectedAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        isInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('One or more of the Entries is Invalid!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(ctx);
                });
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }

    widget.onAddExpense(Expense(
        title: _titleController.text,
        date: _selectedDate!,
        amount: selectedAmount!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintFadeDuration: Duration(milliseconds: 500),
                  hintText: 'Enter an Expense Title',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                //AMOUNT ROW
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      //AMOUNT WIDGET
                      controller: _amountController,
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefix: Text('INR '),
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected' //Also, Imported the formatter function from the Models Expense file
                            : formatter.format(
                                _selectedDate!), //! Sign to force flutter to consider it as a non-null value which it'll definitely be.
                      ),
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_today_outlined),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                //Buttons Row for SUBMIT AND CANCEL
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _submitValidate,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
