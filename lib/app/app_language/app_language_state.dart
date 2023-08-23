// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_language_cubit.dart';

class AppLanguageState extends Equatable {
  final Locale locale;
  // final AppTheme appTheme;
  const AppLanguageState({
    required this.locale,
    // required this.appTheme,
  });

  @override
  List<Object> get props => [locale.languageCode, appTheme];

  AppLanguageState copyWith({
    Locale? locale,
  }) {
    return AppLanguageState(
      locale: locale ?? this.locale,
    );
  }
}
