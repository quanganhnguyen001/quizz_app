import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/gen/assets/assets.gen.dart';
import '../app/app_language/app_language_cubit.dart';
import '../app/app_theme/app_theme_cubit.dart';

import 'screen/base_screen/base_screen.dart';

import '../gen/localization/l10n.dart';
import '../theme/app_theme.dart';

class UITestingWidget extends StatefulWidget {
  static const String routeName = "/UITestingWidget";
  const UITestingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UITestingWidget> createState() => _UITestingWidgetState();
}

class _UITestingWidgetState extends State<UITestingWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffold: (ctx) => Scaffold(
        backgroundColor: colorOf(ctx).primaryColor,
        appBar: AppBar(
          title: Text(Str.of(context).uiTesting),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            BlocBuilder<AppLanguageCubit, AppLanguageState>(
              builder: (context, state) {
                return AnimatedToggleSwitch<Locale>.rolling(
                  indicatorSize: const Size(48, 100),
                  height: 36,
                  current: Localizations.localeOf(context),
                  values: Str.delegate.supportedLocales,
                  onChanged: context.read<AppLanguageCubit>().changeLanguage,
                  iconBuilder: (locale, size, value) {
                    var data =
                        Center(child: Text(locale.languageCode.toUpperCase()));
                    if (value) {
                      data = Center(
                          child: Text(locale.languageCode.toUpperCase()));
                    }
                    return data;
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: BlocBuilder<AppThemeCubit, AppThemeState>(
                builder: (context, state) {
                  return AnimatedToggleSwitch<AppTheme>.rolling(
                    indicatorSize: const Size(48, 100),
                    height: 36,
                    current: context.read<AppThemeCubit>().state.appTheme,
                    values: const [AppTheme.dark, AppTheme.light],
                    onChanged: context.read<AppThemeCubit>().changeTheme,
                    iconBuilder: (theme, size, value) {
                      var data = Center(child: Text(theme.name.toString()));
                      if (value) {
                        data = Center(child: Text(theme.name.toString()));
                      }
                      return data;
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: Assets.images.coolKidsOnWheels.image(),
      ),
    );
  }
}
