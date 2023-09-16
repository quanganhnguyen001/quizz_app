import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:od/features/chat_gpt/presentation/cubit/chat_gpt_cubit.dart';
import 'package:od/features/chat_gpt/presentation/pages/chat_gpt_screen.dart';

import 'package:od/features/forgot_pass/presentation/cubit/forgot_pass_cubit.dart';
import 'package:od/features/forgot_pass/presentation/pages/forgot_password_screen.dart';

import 'package:od/features/home/presentation/cubit/home_cubit.dart';
import 'package:od/features/home/presentation/pages/home_screen.dart';
import 'package:od/features/login/presentation/cubit/login_cubit.dart';

import 'package:od/features/onboarding/presentation/pages/onboard_screens.dart';

import 'package:od/features/question/presentation/cubit/question_cubit.dart';
import 'package:od/features/question/presentation/pages/question_screen.dart';
import 'package:od/features/register/presentation/cubit/register_cubit.dart';
import 'package:od/features/register/presentation/pages/register_screen.dart';

import 'package:od/features/todo/presentation/pages/add_todo_screen.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_arguments.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_screen.dart';
import 'package:od/features/update_profile/presentation/cubit/update_profile_cubit.dart';
import 'package:od/features/update_profile/presentation/widgets/update_profile_arg.dart';
import 'package:od/features/update_profile/presentation/pages/update_profile_widget.dart';

import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/todo/presentation/pages/todo_screen.dart';
import '../../widgets_catalog/ui_testing.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    if (settings.name == SplashScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: SplashScreen.routeName),
        builder: (_) => const SplashScreen(),
      );
    }
    if (settings.name == OnboardScreens.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: OnboardScreens.routeName),
        builder: (_) => const OnboardScreens(),
      );
    }
    if (settings.name == UpdateProfile.routeName) {
      final args = settings.arguments as UpdateProfileArg;
      return MaterialPageRoute(
        settings: const RouteSettings(name: UpdateProfile.routeName),
        builder: (_) => BlocProvider(
            create: (context) => UpdateProfileCubit(),
            child: UpdateProfile(arg: args)),
      );
    }
    if (settings.name == RegisterScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: RegisterScreen.routeName),
        builder: (_) => BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
          child: const RegisterScreen(),
        ),
      );
    }
    if (settings.name == QuestionScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: QuestionScreen.routeName),
        builder: (_) => BlocProvider(
          create: (context) => QuestionCubit()..getAllQuestion(),
          child: const QuestionScreen(),
        ),
      );
    }

    if (settings.name == UITestingWidget.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: UITestingWidget.routeName),
        builder: (_) => const UITestingWidget(),
      );
    }

    if (settings.name == LoginScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: LoginScreen.routeName),
        builder: (_) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      );
    }
    if (settings.name == ChatGptScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: ChatGptScreen.routeName),
        builder: (_) => BlocProvider(
          create: (context) => ChatGptCubit(),
          child: const ChatGptScreen(),
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
        settings: const RouteSettings(name: ForgotPasswordScreen.routeName),
        builder: (_) => BlocProvider(
          create: (context) => ForgotPassCubit(),
          child: const ForgotPasswordScreen(),
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
          child: const HomeScreen(),
        ),
      );
    }
    return null;
  }
}
