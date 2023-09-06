import 'package:flutter/material.dart';
import 'package:od/gen/assets/assets.gen.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';
import '../widgets/option_widget.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = '/QuestionScreen';
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
              children: [
                Center(
                  child: Text(
                    '1 of 20',
                    style: AppTextStyle.paragraphLarge(
                        color: ColorPalettes.darkgrayColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Which tag for the biggest header?',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.H4(),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                          width: double.infinity,
                          height: 191,
                          color: ColorPalettes.lightGrayColor,
                          child: Assets.images.idea.image())),
                ),
                SizedBox(
                  height: 16,
                ),
                OptionWidget(),
                SizedBox(
                  height: 16,
                ),
                OptionWidget(),
                SizedBox(
                  height: 16,
                ),
                OptionWidget(),
                SizedBox(
                  height: 16,
                ),
                OptionWidget(),
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
                title: 'Next',
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
