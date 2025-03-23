import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(this.title, this.amount, this.date, this.category) : id = Uuid().v4();

  String get formattedDate {
    return DateFormat.yMEd().format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
