import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:od/app/app_theme/app_theme_cubit.dart';
import 'package:od/common/cubit/cubit/user_cubit.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';
import 'package:od/features/auth/entities/user_model.dart';
import 'package:od/features/chat_gpt/presentation/cubit/chat_gpt_cubit.dart';
import 'package:od/features/chat_gpt/presentation/pages/chat_gpt_screen.dart';

import 'package:od/features/forgot_pass/presentation/cubit/forgot_pass_cubit.dart';
import 'package:od/features/forgot_pass/presentation/pages/forgot_password_screen.dart';

import 'package:od/features/home/presentation/cubit/home_cubit.dart';
import 'package:od/features/home/presentation/pages/home_screen.dart';
import 'package:od/features/login/presentation/cubit/login_cubit.dart';

import 'package:od/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:od/features/onboarding/presentation/pages/onboard_screens.dart';
import 'package:od/features/profile/presentation/pages/profile_screen.dart';
import 'package:od/features/question/presentation/pages/question_screen.dart';
import 'package:od/features/register/presentation/cubit/register_cubit.dart';
import 'package:od/features/register/presentation/pages/register_screen.dart';
import 'package:od/features/settings/presentation/pages/settings_screen.dart';
import 'package:od/features/todo/presentation/pages/add_todo_screen.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_arguments.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_screen.dart';
import 'package:od/features/update_profile/presentation/cubit/update_profile_cubit.dart';
import 'package:od/features/update_profile/presentation/widgets/update_profile_arg.dart';
import 'package:od/features/update_profile/presentation/pages/update_profile_widget.dart';

import '../features/login/presentation/pages/login_screen.dart';
import '../features/splash/presentation/pages/splash_screen.dart';
import '../features/todo/presentation/pages/todo_screen.dart';
import '../gen/localization/l10n.dart';
import '../widgets_catalog/ui_testing.dart';
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
              onGenerateRoute: (settings) {
                if (settings.name == SplashScreen.routeName) {
                  return MaterialPageRoute(
                    settings: const RouteSettings(name: SplashScreen.routeName),
                    builder: (_) => const SplashScreen(),
                  );
                }
                if (settings.name == OnboardScreens.routeName) {
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: OnboardScreens.routeName),
                    builder: (_) => OnboardScreens(),
                  );
                }
                if (settings.name == UpdateProfile.routeName) {
                  final args = settings.arguments as UpdateProfileArg;
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: UpdateProfile.routeName),
                    builder: (_) => BlocProvider(
                        create: (context) => UpdateProfileCubit(),
                        child: UpdateProfile(arg: args)),
                  );
                }
                if (settings.name == RegisterScreen.routeName) {
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: RegisterScreen.routeName),
                    builder: (_) => BlocProvider<RegisterCubit>(
                      create: (context) => RegisterCubit(),
                      child: RegisterScreen(),
                    ),
                  );
                }
                if (settings.name == QuestionScreen.routeName) {
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: QuestionScreen.routeName),
                    builder: (_) => const QuestionScreen(),
                  );
                }

                if (settings.name == UITestingWidget.routeName) {
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: UITestingWidget.routeName),
                    builder: (_) => const UITestingWidget(),
                  );
                }

                if (settings.name == LoginScreen.routeName) {
                  return MaterialPageRoute(
                    settings: const RouteSettings(name: LoginScreen.routeName),
                    builder: (_) => BlocProvider<LoginCubit>(
                      create: (context) => LoginCubit(),
                      child: LoginScreen(),
                    ),
                  );
                }
                if (settings.name == ChatGptScreen.routeName) {
                  return MaterialPageRoute(
                    settings:
                        const RouteSettings(name: ChatGptScreen.routeName),
                    builder: (_) => BlocProvider(
                      create: (context) => ChatGptCubit(),
                      child: ChatGptScreen(),
                    ),
                  );
                }
                if (settings.name == TodoScreen.routeName) {
                  return MaterialPageRoute(
                    settings: const RouteSettings(name: TodoScreen.routeName),
                    builder: (_) => const TodoScreen(),
                  );
                }
                if (settings.name == AddTodo.routeName) {
                  final argument = settings.arguments as dynamic;
                  return MaterialPageRoute(
                    settings: const RouteSettings(name: AddTodo.routeName),
                    builder: (_) => AddTodo(listTodo: argument),
                  );
                }

                if (settings.name == ForgotPasswordScreen.routeName) {
                  return MaterialPageRoute(
                    settings: const RouteSettings(
                        name: ForgotPasswordScreen.routeName),
                    builder: (_) => BlocProvider(
                      create: (context) => ForgotPassCubit(),
                      child: ForgotPasswordScreen(),
                    ),
                  );
                }
                if (settings.name == EditTodo.routeName) {
                  final arg = settings.arguments as EditTodoArg;
                  return MaterialPageRoute<EditTodoArg>(
                      settings: const RouteSettings(name: EditTodo.routeName),
                      builder: (_) {
                        return EditTodo(arg: arg);
                      });
                }

                if (settings.name == HomeScreen.routeName) {
                  return MaterialPageRoute(
                    settings: const RouteSettings(name: HomeScreen.routeName),
                    builder: (_) => BlocProvider<HomeCubit>(
                      create: (context) => HomeCubit(),
                      child: HomeScreen(),
                    ),
                  );
                }
                return null;
              },
              initialRoute: "/SplashScreen",
              builder: EasyLoading.init(),
            );
          },
        ),
      );
    });
  }
}
