import 'package:expense_app/common/styled_text.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widget/chart/chart.dart';
import 'package:expense_app/widget/expenses_list/expenses_list.dart';
import 'package:expense_app/widget/new_expense.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense('Binance Future', 20000.99, DateTime.now(), Category.leisure),
    Expense(
        'Popeyes', 15.69, DateTime.utc(2025, 1, 10, 10, 50, 14), Category.food),
    Expense('Ehehe', 22059.69, DateTime.utc(2025, 1, 10, 10, 50, 14),
        Category.work),
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
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const StyledText(
          'Expense deleted!', 16, Constant.primaryTextColor, true),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: StyledText('No expense found. Start adding some!', 14,
          Constant.primaryTextColor, true),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent =
          ExpensesList(_registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title:
            const StyledText('Ex Tracker', 24, Constant.primaryTextColor, true),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add, color: Constant.primaryTextColor),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: Constant.colors,
            begin: Constant.beginAlignment,
            end: Constant.endAlignment,
          ),
        ),
        child: screenW < 800
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
      ),
    );
  }
}
