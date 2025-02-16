import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(this.title, this.amount, this.date, this.category): id = Uuid().v4();

  String get formattedDate {
    return DateFormat.yMEd().format(date);
  }
}