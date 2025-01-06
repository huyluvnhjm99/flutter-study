import 'package:flutter/material.dart';
import 'package:quiz_app/data/answer.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'data/constants.dart';
import 'data/question.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen;
  final List<Answer> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  void chooseAnswer(Answer answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = ResultScreen(selectedAnswers);
        selectedAnswers.removeRange(0, selectedAnswers.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Constant.colors,
                begin: Constant.beginAlignment,
                end: Constant.endAlignment,
              ),
            ),
            child: activeScreen,
        ),
      ),
    );
  }
}