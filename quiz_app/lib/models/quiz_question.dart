import 'package:quiz_app/data/answer.dart';

class QuizQuestion {
  final String text;
  final List<Answer> answers;

  const QuizQuestion(this.text, this.answers);

  List<Answer> get shuffledAnswers {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}