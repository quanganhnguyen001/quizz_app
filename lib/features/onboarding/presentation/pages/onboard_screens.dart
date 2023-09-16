import 'package:flutter/material.dart';
import 'package:od/app/app_theme/app_theme_cubit.dart';
import 'package:od/app/app_theme/app_theme_listener.dart';

import 'package:od/features/login/presentation/pages/login_screen.dart';
import 'package:od/theme/typhography.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../gen/localization/l10n.dart';
import '../../domain/entities/onboarding_entities.dart';

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});
  static const String routeName = '/OnboardScreens';

  @override
  State<OnboardScreens> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  int currentIndex = 0;
  final controller = PageController();

  late List<OnboardModel> tabs = [
    OnboardModel(
        title: Str.of(context).onboardTitle1,
        label:
            'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
        imageAssets: 'assets/images/cool_kids_long_distance_relationship.png'),
    OnboardModel(
        title: Str.of(context).onboardTitle2,
        label:
            'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
        imageAssets: 'assets/images/illustration.png'),
    OnboardModel(
        title: Str.of(context).onboardTitle3,
        label:
            'Quarantine is the perfect time to spend your \nday learning something new, from anywhere!',
        imageAssets: 'assets/images/illustration_2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ThemeListener(builder: (ctx) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName, (route) => false);
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('isFirst', 'No');
                    },
                    icon: Text(
                      Str.of(context).skip,
                      style: const TextStyle(
                          fontSize: 14,
                          height: 16 / 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(120, 116, 109, 1)),
                    )),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 115,
                          ),
                          Image.asset(tabs[index].imageAssets),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Text(tabs[index].title,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.H4()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Text(Str.of(context).onboardLabel,
                                style: AppTextStyle.paragraphMedium()),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      height: 6,
                                      width: currentIndex == index ? 16 : 6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: currentIndex == index
                                              ? const Color.fromRGBO(
                                                  101, 170, 234, 1)
                                              : const Color.fromRGBO(
                                                  213, 212, 212, 1)),
                                    )),
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: ElevatedButton(
                onPressed: () async {
                  if (currentIndex == tabs.length - 1) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (route) => false);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('isFirst', 'No');
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(311, 56),
                    backgroundColor: const Color.fromRGBO(227, 86, 42, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text(
                    currentIndex == tabs.length - 1
                        ? Str.of(context).start
                        : Str.of(context).next,
                    style: AppTextStyle.buttonMedium(
                        color: colorOf(ctx).inkWhite)),
              ),
            )
          ],
        ),
      );
    });
  }
}
