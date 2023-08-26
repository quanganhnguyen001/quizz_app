import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/common/cubit/cubit/user_cubit.dart';
import 'package:od/features/auth/entities/user_model.dart';
import 'package:od/features/course/presentation/pages/course_screen.dart';
import 'package:od/features/home/presentation/cubit/home_cubit.dart';
import 'package:od/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:od/features/profile/presentation/pages/profile_screen.dart';
import 'package:od/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:od/features/settings/presentation/pages/settings_screen.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';
import 'package:od/widgets_catalog/screen/base_screen/base_screen.dart';

import '../../../../gen/assets/assets.gen.dart';
import '../../../../gen/localization/l10n.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (ctx) {
      return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, homeState) {
          return BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
            List<Widget> page = [
              CourseScreen(
                user: userState.user ?? UserModel(),
              ),
              ProfileScreen(
                user: userState.user ?? UserModel(),
              ),
              SettingsScreen(
                user: userState.user ?? UserModel(),
              ),
            ];
            return Scaffold(
              body: page[homeState.currentIndex],
              bottomNavigationBar: Container(
                height: 98,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: ColorPalettes.grayColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: BottomNavigationBar(
                    onTap: (value) {
                      context.read<HomeCubit>().changeBottomNavBar(value);
                    },
                    unselectedItemColor: ColorPalettes.grayColor,
                    selectedItemColor: ColorPalettes.primaryColor,
                    unselectedLabelStyle: AppTextStyle.paragraphMedium(),
                    selectedLabelStyle: AppTextStyle.paragraphMedium(),
                    currentIndex: homeState.currentIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Assets.images.courses.image(
                                color: homeState.currentIndex == 0
                                    ? ColorPalettes.primaryColor
                                    : ColorPalettes.grayColor),
                          ),
                          label: Str.of(context).course),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Assets.images.profile.image(
                                color: homeState.currentIndex == 1
                                    ? ColorPalettes.primaryColor
                                    : ColorPalettes.grayColor),
                          ),
                          label: Str.of(context).profile),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Assets.images.wheel1.image(
                                color: homeState.currentIndex == 2
                                    ? ColorPalettes.primaryColor
                                    : ColorPalettes.grayColor),
                          ),
                          label: Str.of(context).settings),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      );
    });
  }
}
