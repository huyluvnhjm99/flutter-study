import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

import 'data/answer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, {super.key});

  final List<Answer> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const StyledText('Your answered x out of y questions correctly!', 24, Color.fromARGB(255, 255, 255, 255), true),
              const SizedBox(height: 25),
              const StyledText('List of answers & questions...', 24, Color.fromARGB(255, 255, 255, 255), true),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () {},
                label: StyledText('Restart Quiz', 16, Color.fromARGB(255, 211, 146, 255), true),
                icon: Icon(Icons.restart_alt, color: Color.fromARGB(255, 211, 146, 255), size: 26,),
              ),
            ],
          ),
        ));
  }
}