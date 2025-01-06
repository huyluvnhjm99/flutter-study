import 'package:flutter/material.dart';

import 'package:quiz_app/data/constants.dart';
import 'package:quiz_app/styled_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onSelected});

  final String answerText;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onSelected,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        ),
        child: StyledText(answerText, 16, Constant.colors[3], false));
  }
}