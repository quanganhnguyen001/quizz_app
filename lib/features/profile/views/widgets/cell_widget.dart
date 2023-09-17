import 'package:flutter/material.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.title,
  });
  final String label;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 82,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: ColorPalettes.grayColor)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalettes.secondaryColor,
                        ),
                        child: icon),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        title,
                        style: AppTextStyle.H5(color: ColorPalettes.darkColor),
                      ),
                      Text(
                        label,
                        style: AppTextStyle.paragraphMedium(
                            color: ColorPalettes.darkgrayColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
