import 'package:flutter/material.dart';

import 'package:quizz_app/gen/localization/l10n.dart';
import 'package:quizz_app/model/onboard_mode.dart';

import '../../theme/styles_text.dart';

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  State<OnboardScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<OnboardScreens> {
  int currentIndex = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Text(
                Str.of(context).skip,
                style: const TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(120, 116, 109, 1)),
              ))
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return SafeArea(
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
                  child: Text(
                    onboardTitle(index),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: StyleText.dark,
                        fontSize: StyleText.fontSizeTitle,
                        height: 32 / 24,
                        fontWeight: StyleText.fontTextTitle),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    Str.of(context).onboardLabel,
                    style: TextStyle(
                        color: StyleText.darkGray,
                        fontSize: StyleText.fontSizeLabel,
                        fontWeight: StyleText.fontTextLabel),
                  ),
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
                                borderRadius: BorderRadius.circular(20),
                                color: currentIndex == index
                                    ? const Color.fromRGBO(101, 170, 234, 1)
                                    : const Color.fromRGBO(213, 212, 212, 1)),
                          )),
                ),
                const SizedBox(
                  height: 69,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentIndex == tabs.length - 1) {
                        Navigator.of(context).pushNamed('/homeScreens');
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
                      style: TextStyle(
                          fontSize: StyleText.fontSizeButton,
                          fontWeight: StyleText.fontTextTitle,
                          height: 18 / 16),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }

  String onboardTitle(int index) {
    if (index == 0) {
      return Str.of(context).onboardTitle1;
    } else if (index == 1) {
      return Str.of(context).onboardTitle2;
    } else {
      return Str.of(context).onboardTitle3;
    }
  }
}
