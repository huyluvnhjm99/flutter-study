import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/styled_text.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
              (item) {
                return Column(
                  children: [
                    Row(

                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: item['user_answer'] == item['correct_answer'] ? const Color.fromARGB(255, 0, 255, 43) : const Color.fromARGB(255, 255, 0, 0),
                            borderRadius: BorderRadius.circular(500),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            ((item['index'] as int) + 1).toString(),
                            style:  GoogleFonts.tiltNeon(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledText.defaultColor(item['question'] as String, 15, true),
                              StyledText(
                                  'Your answer: ${item['user_answer'] as String}',
                                  14,
                                  item['user_answer'] == item['correct_answer'] ? const Color.fromARGB(255, 0, 255, 43) : const Color.fromARGB(255, 255, 0, 0),
                                  true),
                              StyledText.defaultColor('Correct answer: ${item['correct_answer'] as String}', 14, false),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20)
                  ],
                );
              }
          ).toList(),
        ),
      ),
    );
  }

}