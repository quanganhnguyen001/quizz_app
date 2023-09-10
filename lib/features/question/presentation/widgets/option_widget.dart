import 'package:flutter/material.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.text,
    required this.index,
    required this.press,
    required this.isSelect,
    required this.correctAnswer,
    required this.selectedAnswerIndex,
  });
  final String text;
  final int index;
  final VoidCallback? press;
  final bool isSelect;
  final int correctAnswer;
  final int selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer = index == correctAnswer;
    final bool isWrongAnswer = !isCorrectAnswer && isSelect;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: press,
        child: Container(
          height: 58,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: selectedAnswerIndex >= 0
                  ? Border.all(
                      width: isCorrectAnswer
                          ? 4
                          : isWrongAnswer
                              ? 4
                              : 1,
                      color: isCorrectAnswer
                          ? Colors.green
                          : isWrongAnswer
                              ? Colors.red
                              : ColorPalettes.grayColor)
                  : Border.all(width: 1, color: ColorPalettes.grayColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${index + 1}. $text',
                    style: AppTextStyle.paragraphLarge(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
