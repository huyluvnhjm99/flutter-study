import 'package:expense_app/common/constants.dart';
import 'package:expense_app/common/styled_text.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(expense.category == Category.food
                  ? Icons.fastfood_outlined
                  : expense.category == Category.leisure
                      ? Icons.monetization_on_outlined
                      : expense.category == Category.work
                          ? Icons.work_history_outlined
                          : Icons.card_travel),
            ),
            // SizedBox(
            //   height: 50.0,
            //   child: const VerticalDivider(
            //     thickness: 1,
            //     color: Colors.grey,
            //   ),
            // ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 200.0, // Set a fixed width for horizontal scrolling
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.subject, size: 13,),
                      const SizedBox(width: 3.0),
                      // Expanded(child: StyledText(expense.title, 14.0, Colors.black, false)),
                      Expanded(child: Text(expense.title, style: Theme.of(context).textTheme.titleLarge,)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.date_range, size: 14,),
                      const SizedBox(width: 3.0),
                      StyledText(
                          expense.formattedDate, 14.0, Colors.black, false),
                    ],
                  ),
                  StyledText(expense.id.toString(), 7.0, Colors.grey, false)
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            const Spacer(),
            StyledText('\$ ${expense.amount.toStringAsFixed(2)}', 20,
                Constant.primaryTextColor, true),
          ],
        ),
      ),
    );
  }
}
