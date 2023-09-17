// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:od/features/chat_gpt/views/widgets/text_widget.dart';

import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget(
      {super.key,
      required this.message,
      required this.chatIndex,
      required this.showAnimate});
  final String message;
  final int chatIndex;
  final bool showAnimate;

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
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: chatIndex == 0
                        ? TextWidget(label: message)
                        : showAnimate
                            ? DefaultTextStyle(
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  repeatForever: false,
                                  displayFullTextOnTap: true,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(message.trim())
                                  ],
                                ),
                              )
                            : Text(
                                message.trim(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
