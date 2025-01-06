import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color color;
  final bool isBold;
  const StyledText(this.text, this.fontSize, this.color, this.isBold, {super.key});
  const StyledText.defaultColor(this.text, this.fontSize, this.isBold, {super.key}): color = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.tiltNeon(color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
      // style: TextStyle(),
    );
  }
}
