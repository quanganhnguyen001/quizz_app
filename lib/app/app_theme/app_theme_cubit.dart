import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../theme/app_theme.dart';

part 'app_theme_state.dart';

/// scaffold: (ctx) => Scaffold(
///           backgroundColor: colorOf(ctx).primaryColor);
YinColorScheme colorOf(BuildContext ctx) {
  return ctx.read<AppThemeCubit>().state.appColor;
}

class AppThemeCubit extends HydratedCubit<AppThemeState> {
  AppThemeCubit()
      : super(
          const AppThemeState(
            appTheme: AppTheme.light,
            appColor: YinColorScheme.l(),
          ),
        );
  @override
  AppThemeState? fromJson(Map<String, dynamic> json) {
    final String? themeName = json['appTheme'];
    final AppTheme appTheme = AppTheme.values.firstWhere(
      (element) => element.value == themeName,
      orElse: () {
        return AppTheme.light;
      },
    );

    return AppThemeState(
      appTheme: appTheme,
      appColor: appColor[state.appTheme]!,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppThemeState state) {
    final Map<String, dynamic> stateJson = {
      'appTheme': state.appTheme.value,
    };
    return stateJson;
  }

  void changeTheme(AppTheme appTheme) {
    emit(AppThemeState(appTheme: appTheme, appColor: appColor[appTheme]!));
  }
}
