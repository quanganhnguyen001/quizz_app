import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:od/app/app_theme/app_theme_cubit.dart';
import 'package:od/common/cubit/cubit/user_cubit.dart';
import 'package:od/core/router/route.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';

import '../gen/localization/l10n.dart';

import 'app_language/app_language_cubit.dart';

class YinApp extends StatefulWidget {
  const YinApp({
    Key? key,
  }) : super(key: key);

  @override
  State<YinApp> createState() => _YinAppState();
}

class _YinAppState extends State<YinApp> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
          ),
          BlocProvider<AppLanguageCubit>(
            create: (context) => AppLanguageCubit(),
          ),
          BlocProvider<AppThemeCubit>(
            create: (context) => AppThemeCubit(),
          ),
          BlocProvider<UserCubit>(
            create: (context) => UserCubit()..loadUserData(),
          ),
        ],
        child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
              ),
              localizationsDelegates: const [
                Str.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: context.read<AppLanguageCubit>().state.locale,
              supportedLocales: Str.delegate.supportedLocales,
              navigatorObservers: [NavigatorObserver()],
              onGenerateRoute: OnGenerateRoute.route,
              initialRoute: "/SplashScreen",
              builder: EasyLoading.init(),
            );
          },
        ),
      );
    });
  }
}
