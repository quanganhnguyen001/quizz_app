import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quizz_app/gen/localization/l10n.dart';
import 'package:quizz_app/screen/home_screen.dart';

import 'package:quizz_app/screen/splash_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = const Locale("vi");
  List<Locale> supp = [const Locale("vi"), const Locale("en")];
  // This widget is the root of your application.
  void toggleLanguage() {
    setState(() {
      if (locale.languageCode == "vi") {
        locale = const Locale("en");
      } else {
        locale = const Locale("vi");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: Str.delegate.supportedLocales,
      localizationsDelegates: const [
        Str.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: ((context) => const SplashScreens()));
          case '/homeScreens':
            return MaterialPageRoute(
                builder: ((context) => const HomeScreens()));
          default:
            return null;
        }
      },
    );
  }
}
