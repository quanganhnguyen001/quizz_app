import 'package:flutter/material.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../gen/localization/l10n.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Str.of(context).hello,
                        style: AppTextStyle.paragraphLarge(
                            color: ColorPalettes.darkColor),
                      ),
                      Text(
                        'Quang Anh',
                        style: AppTextStyle.H3(
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      )
                    ],
                  ),
                  HeaderButtonComponents(
                    height: 40,
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldComponents(
                radius: 12,
                hinText: Str.of(context).search_course,
                hintStyle: AppTextStyle.paragraphMedium(
                    color: ColorPalettes.darkgrayColor),
                rightIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 297,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 1, color: ColorPalettes.grayColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                          height: 194,
                          color: ColorPalettes.lightGrayColor,
                          child: Assets.images.flutterIcon.image()),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Flutter',
                                  style: AppTextStyle.H4(
                                      color: ColorPalettes.darkColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  Str.of(context).course_des,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.paragraphMedium(
                                      color: ColorPalettes.darkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: HeaderButtonComponents(
                            height: 40,
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
