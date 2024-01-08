import 'package:expense/Widgets/Expense_list/expense_item.dart';
import 'package:expense/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.registeredExpense,
    required this.onRemoveExpense,
  });

  final List<Expense> registeredExpense;
  final Function(Expense expense) onRemoveExpense;

  Widget build(context) {
    return ListView.builder(
      itemCount: registeredExpense.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          registeredExpense[index],
        ),
        onDismissed: (direction) {
          onRemoveExpense(registeredExpense[index]);
        },
        child: ExpenseItem(registeredExpense[index]),
      ),
    );
  }
}
