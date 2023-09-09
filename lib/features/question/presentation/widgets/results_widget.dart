import 'package:flutter/material.dart';
import 'package:od/features/home/presentation/pages/home_screen.dart';
import 'package:od/gen/assets/assets.gen.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key, required this.score});
  final int score;

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
          'Results',
          style: AppTextStyle.H4(color: ColorPalettes.darkColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Assets.images.coolKidsXmasMorning.image(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Congratulations',
                  style: AppTextStyle.H4(),
                ),
                Text(
                  'Congratulations for complete \nall the answers!',
                  style: AppTextStyle.paragraphMedium(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${score}/50',
                  style: AppTextStyle.H1(color: Colors.green),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonComponents(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.routeName, (route) => false);
                },
                height: 56,
                radius: 16,
                title: 'Back to Home ',
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
