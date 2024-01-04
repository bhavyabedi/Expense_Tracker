import 'package:expense/Widgets/Expense_list/expense_item.dart';
import 'package:expense/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.registeredExpense,
  });
  final List<Expense> registeredExpense;
  Widget build(context) {
    return ListView.builder(
        itemCount: registeredExpense.length,
        itemBuilder: (ctx, index) => ExpenseItem(registeredExpense[index]));
  }
}
