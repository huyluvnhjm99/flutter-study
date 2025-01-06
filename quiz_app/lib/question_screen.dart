import 'package:flutter/material.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/data/question.dart';

import 'data/answer.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chooseAnswer, {super.key});

  final Function(Answer answer) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(Answer answer) {
    setState(() {
      widget.chooseAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentQuestionIndex];

    return Center(
        child: Container(
      margin: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            currentQuestion.text,
            24,
            Color.fromARGB(255, 255, 255, 255),
            true,
          ),
          SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerText: answer.text,
              onSelected: () {
                answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    ));
  }
}
