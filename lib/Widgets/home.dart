import 'package:expense/Widgets/Expense_list/expense_list.dart';
import 'package:expense/Widgets/new_expense.dart';
import 'package:expense/models/expense.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Lunch',
      date: DateTime.now(),
      amount: 12.56,
      category: Category.food,
    ),
    Expense(
      title: 'Movie',
      date: DateTime.now(),
      amount: 16,
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: const Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => const NewExpense(),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const Text('CHART'),
          Expanded(
            child: ExpenseList(registeredExpense: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
