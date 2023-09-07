import 'package:flutter/material.dart';
import 'package:od/features/question/presentation/pages/question_screen.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';

class DetailsCourseScreen extends StatelessWidget {
  const DetailsCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: HeaderButtonComponents(
            padding: EdgeInsets.only(left: 5),
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
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
                SizedBox(
                  height: 16,
                ),
                Assets.images.illustration3.image(),
                SizedBox(
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
                    'You can launch a new career in web develop-ment today by learning HTML & CSS. You don"t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
                    style: AppTextStyle.paragraphMedium(),
                  ),
                ),
                SizedBox(
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
