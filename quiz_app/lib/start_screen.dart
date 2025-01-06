import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Opacity(opacity: 0.7, child:  Image.asset('assets/images/quiz-logo.png',width: 250)),
          Image.asset('assets/images/quiz-logo.png', width: 250, color: const Color.fromARGB(150, 255, 255, 255),),
          SizedBox(height: 20),
          StyledText.defaultColor('Learn Flutter the fun way!', 20, true),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: switchScreen,
            label: StyledText('Start Quiz', 16, const Color.fromARGB(255, 211, 146, 255), true),
            icon: Icon(Icons.not_started_outlined, color: const Color.fromARGB(255, 211, 146, 255), size: 26,),
          ),
        ],
      ),
    );
  }
}
