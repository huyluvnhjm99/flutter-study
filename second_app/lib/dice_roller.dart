import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_app/styled_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {

  var activeDiceImage = 'assets/images/dice-2.png';

  void rollDice() {
    setState(() {
      activeDiceImage = 'assets/images/dice-${Random().nextInt(6) + 1}.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(),
          child: const StyledText('Roll'),
        )
      ],
    );
  }
}