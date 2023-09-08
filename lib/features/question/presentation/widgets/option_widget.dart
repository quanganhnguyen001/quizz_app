import 'package:flutter/material.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: press,
        child: Container(
          height: 58,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: ColorPalettes.grayColor)),
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
