import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/features/settings/presentation/widgets/menu_item.dart';
import 'package:od/features/settings/presentation/widgets/update_profile_widget.dart';
import 'package:od/gen/localization/l10n.dart';

import 'package:od/theme/color_palettes.dart';

import '../../../../app/app_language/app_language_cubit.dart';
import '../../../../app/app_theme/app_theme_cubit.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/typhography.dart';
import '../../../auth/entities/user_model.dart';
import '../../../profile/presentation/widgets/cell_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/SettingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Str.of(context).settings,
            style: AppTextStyle.H4(),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(child: Assets.images.coolKidsOnBike.image()),
            const SizedBox(
              height: 16,
            ),
            MenuItem(
              title: Str.of(context).change_language,
              icon: Icon(Icons.language),
              change: BlocBuilder<AppLanguageCubit, AppLanguageState>(
                builder: (context, state) {
                  return AnimatedToggleSwitch<Locale>.rolling(
                    borderColor: Colors.grey,
                    indicatorColor: Colors.green,
                    indicatorSize: const Size(48, 100),
                    height: 36,
                    current: Localizations.localeOf(context),
                    values: Str.delegate.supportedLocales,
                    onChanged: context.read<AppLanguageCubit>().changeLanguage,
                    iconBuilder: (locale, size, value) {
                      var data = Center(
                          child: Text(locale.languageCode.toUpperCase()));
                      if (value) {
                        data = Center(
                            child: Text(locale.languageCode.toUpperCase()));
                      }
                      return data;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MenuItem(
              title: Str.of(context).change_theme,
              icon: Icon(Icons.dark_mode),
              change: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: BlocBuilder<AppThemeCubit, AppThemeState>(
                  builder: (context, state) {
                    return AnimatedToggleSwitch<AppTheme>.rolling(
                      indicatorSize: const Size(48, 100),
                      borderColor: Colors.grey,
                      indicatorColor: Colors.green,
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
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpdateProfileWidget()));
              },
              child: MenuItem(
                title: Str.of(context).update_info,
                icon: Icon(Icons.person),
                change: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ));
  }
}
