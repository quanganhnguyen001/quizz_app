// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_theme_cubit.dart';

class AppThemeState extends Equatable {
  final AppTheme appTheme;
  final YinColorScheme appColor;

  const AppThemeState({
    required this.appTheme,
    required this.appColor,
  });

  @override
  List<Object> get props => [
        appTheme,
        appColor,
      ];
}
