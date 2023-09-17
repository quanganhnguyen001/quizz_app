import 'package:flutter/material.dart';

import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../question/pages/question_screen.dart';

class DetailsCourseScreen extends StatelessWidget {
  const DetailsCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: HeaderButtonComponents(
            padding: const EdgeInsets.only(left: 5),
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Flutter',
          style: AppTextStyle.H4(color: ColorPalettes.darkColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Assets.images.illustration3.image(),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'About the course',
                    style: AppTextStyle.H4(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'You can launch a new career in mobile develop-ment today by learning Flutter. You don"t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
                    style: AppTextStyle.paragraphMedium(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonComponents(
                onPressed: () {
                  Navigator.pushNamed(context, QuestionScreen.routeName);
                },
                height: 56,
                radius: 16,
                title: 'Start',
                textStyle:
                    AppTextStyle.buttonMedium(color: ColorPalettes.whiteColor),
                backgroundColor: ColorPalettes.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
