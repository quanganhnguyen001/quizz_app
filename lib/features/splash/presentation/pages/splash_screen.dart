import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';
import 'package:od/features/login/presentation/pages/login_screen.dart';

import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/gen/localization/l10n.dart';
import 'package:od/theme/typhography.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../widgets_catalog/screen/base_screen/base_screen.dart';
import '../../../onboarding/presentation/pages/onboard_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? check = prefs.getString('isFirst');
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    if (check == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(OnboardScreens.routeName, (route) => false);
    } else {
      context.read<AuthCubit>().checkAuthentication();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.coolKidsOnWheels.image(),
              const SizedBox(
                height: 16,
              ),
              Text(
                Str.of(context).appName,
                textAlign: TextAlign.center,
                style: AppTextStyle.H2(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
