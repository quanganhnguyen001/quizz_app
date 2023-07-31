import 'dart:async';

import 'package:flutter/material.dart';

import 'package:quizz_app/screen/onboard/onboard_screens.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const OnboardScreens())));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Content.png',
            ),
          )
        ],
      ),
    );
  }
}
