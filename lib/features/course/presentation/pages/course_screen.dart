import 'package:flutter/material.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';
import 'package:od/features/auth/entities/user_model.dart';
import 'package:od/features/chat_gpt/presentation/pages/chat_gpt_screen.dart';
import 'package:od/features/course/presentation/widgets/details_course_screen.dart';
import 'package:od/features/todo/presentation/pages/todo_screen.dart';

import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../gen/localization/l10n.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.user});
  final UserModel user;

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
                        user.name ?? '',
                        style: AppTextStyle.H3(
                            color: const Color.fromRGBO(51, 51, 51, 1)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      HeaderButtonComponents(
                        height: 40,
                        icon: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TodoScreen.routeName);
                          },
                          child: const Icon(
                            Icons.edit_note,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      HeaderButtonComponents(
                        height: 40,
                        icon: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ChatGptScreen.routeName);
                            },
                            child: Assets.images.chatLogo.image()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
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
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                          height: 194,
                          color: ColorPalettes.lightGrayColor,
                          child: Assets.images.flutterIcon.image()),
                    ),
                    const SizedBox(
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
                        const SizedBox(
                          width: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: HeaderButtonComponents(
                            height: 40,
                            icon: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailsCourseScreen()));
                              },
                              icon: const Icon(
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
