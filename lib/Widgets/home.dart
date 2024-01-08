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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    var registeredExpensesIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item Deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(
                  registeredExpensesIndex,
                  expense,
                );
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expenses this month? Track karle Laude.'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        registeredExpense: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          )
        ],
      ),
      body: Column(
        children: [
          const Text('CHART'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
