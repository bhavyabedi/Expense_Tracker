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

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: registeredExpense.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Card(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        ),
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
