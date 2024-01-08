import 'package:expense/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('INR ${expense.amount.toString()}'),
              const Spacer(),
              Row(children: [
                Icon(categoryIcon[expense.category]),
                Text(expense.formattedDate),
              ])
            ],
          ),
        ]),
      ),
    );
  }
}
