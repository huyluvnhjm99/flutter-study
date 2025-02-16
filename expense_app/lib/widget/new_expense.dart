import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

import '../common/constants.dart';
import '../common/styled_text.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseDate() {
    final enteredAmount = double.tryParse(_amountController.text);

    if (_titleController.text.trim().isEmpty ||
        (enteredAmount == null || enteredAmount <= 0) ||
        _selectedDate == null) {
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const StyledText('Invalid inputs!', 24, Constant.cancelColor, false),
        content: const StyledText('Pleas make sure a valid title, amount, date and category was entered!!', 14, Constant.cancelColor, false),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const StyledText('Okay', 24, Constant.primaryTextColor, false),)
        ],
      ),);
      return;
    }

    widget.onAddExpense(Expense(_titleController.text.trim(), enteredAmount, _selectedDate!, _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 46.0, 16.0, 16.0),
      child: Column(
        children: [
          const StyledText(
              'Create new Expense', 24, Constant.primaryTextColor, false),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Title')),
                ),
              ),
              SizedBox(width: 15),
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: StyledText(category.name.toUpperCase(), 12,
                              Constant.primaryTextColor, false),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) return;
                    _selectedCategory = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'Selected Date'
                        : DateFormat.yMEd().format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const StyledText(
                            'Cancel', 16, Constant.cancelColor, false)),
                    TextButton(
                      onPressed: _submitExpenseDate,
                      child: const StyledText(
                          'Save', 16, Constant.primaryTextColor, true),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
