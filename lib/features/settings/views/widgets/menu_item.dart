import 'package:flutter/material.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.change,
  });
  final String title;
  final Widget icon;
  final Widget change;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: ColorPalettes.grayColor),
              borderRadius: BorderRadius.circular(16),
              color: ColorPalettes.whiteColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: AppTextStyle.H5(color: ColorPalettes.darkColor),
                      ),
                    ],
                  ),
                ),
                change
              ],
            ),
          )),
    );
  }
}
