import 'package:flutter/material.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: ColorPalettes.grayColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                'A.',
                style: AppTextStyle.paragraphLarge(),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'H5',
                style: AppTextStyle.paragraphLarge(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
