import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/data/question.dart';

import 'data/answer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.restartQuiz, {super.key});

  final List<Answer> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get quizSummaryData {
    final List<Map<String, Object>> summary = [];
    for(int i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'index': i,
          'question': question[i].text,
          'correct_answer': question[i].answers.where((ans) => ans.isCorrect).first.text,
          'user_answer': selectedAnswers[i].text
        }
      );
    }
    return summary;
  }


  @override
  Widget build(BuildContext context) {

    final correctCount = selectedAnswers.where((ans) => ans.isCorrect).length;
    final totalCount = selectedAnswers.length;

    return Center(
        child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StyledText('Your answered $correctCount out of $totalCount questions correctly!', 24, const Color.fromARGB(255, 255, 255, 255), true),
              const SizedBox(height: 35),
              const StyledText('List of answers & questions:', 24, Color.fromARGB(255, 255, 255, 255), true),
              const SizedBox(height: 5),
              QuestionSummary(summary: quizSummaryData),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: restartQuiz,
                label: StyledText('Restart Quiz', 16, Color.fromARGB(255, 211, 146, 255), true),
                icon: Icon(Icons.restart_alt, color: Color.fromARGB(255, 211, 146, 255), size: 26,),
              ),
            ],
          ),
        ));
  }
}