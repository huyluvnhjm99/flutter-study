import 'package:flutter/material.dart';
import 'package:second_app/dice_roller.dart';

final beginAlignment = Alignment.topLeft;
final endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  const GradientContainer({super.key, required this.colors});
  const GradientContainer.withImage({super.key})
      : colors = const [
          Color.fromARGB(255, 167, 238, 217),
          Color.fromARGB(255, 215, 159, 255),
          Color.fromARGB(255, 195, 126, 252)
        ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: beginAlignment,
              end: endAlignment,
            ),
          ),
          child: Center(
            child: DiceRoller()
          ),
        ),
      ),
    );
  }
}
