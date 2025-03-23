import 'package:flutter/material.dart';

class Constant {
  static const beginAlignment = Alignment.topLeft;
  static const endAlignment = Alignment.bottomRight;
  static const List<Color> colors = [
    Color.fromARGB(255, 73, 255, 198),
    Color.fromARGB(255, 170, 248, 220),
    Color.fromARGB(255, 221, 195, 248),
    Color.fromARGB(255, 203, 139, 255),
    Color.fromARGB(255, 182, 98, 250),
  ];

  static const primaryTextColor = Color.fromARGB(255, 182, 98, 250);
  static const cancelColor = Color.fromARGB(255, 246, 2, 2);
  static const primaryDarkColor = Color.fromARGB(255, 5, 99, 125);

  static var kColorScheme = ColorScheme.fromSeed(seedColor: primaryTextColor);
  static var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: primaryDarkColor,
  );
}
