import 'package:flutter/material.dart';
import 'package:od/features/course/presentation/widgets/text_widget.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key, required this.message, required this.chatIndex});
  final String message;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: chatIndex == 0
              ? ColorPalettes.chatGptBackgroundColor
              : ColorPalettes.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                chatIndex == 0
                    ? Assets.images.person.image(height: 30, width: 30)
                    : Assets.images.chatLogo.image(height: 30, width: 30),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: message))
              ],
            ),
          ),
        )
      ],
    );
  }
}
