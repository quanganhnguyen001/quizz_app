import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/features/gg_maps/cubit/google_map_cubit.dart';

import '../../common/widgets/buttons/switch_button.dart';
import '../../features/chat_gpt/cubit/chat_gpt_cubit.dart';
import '../../features/chat_gpt/views/pages/chat_gpt_screen.dart';
import '../../features/forgot_pass/cubit/forgot_pass_cubit.dart';
import '../../features/forgot_pass/views/pages/forgot_password_screen.dart';
import '../../features/gg_maps/view/page/google_map_screen.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/views/pages/home_screen.dart';

import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/views/pages/login_screen.dart';
import '../../features/onboarding/views/pages/onboard_screens.dart';
import '../../features/question/cubit/question_cubit.dart';

import '../../features/question/views/pages/question_screen.dart';
import '../../features/register/cubit/register_cubit.dart';
import '../../features/register/views/pages/register_screen.dart';

import '../../features/splash/views/pages/splash_screen.dart';

import '../../features/todo/cubit/todo_cubit.dart';
import '../../features/todo/models/edit_todo_arguments.dart';
import '../../features/todo/views/pages/todo_screen.dart';
import '../../features/todo/views/widgets/add_todo_widget.dart';
import '../../features/todo/views/widgets/edit_todo_widget.dart';
import '../../features/update_profile/cubit/update_profile_cubit.dart';
import '../../features/update_profile/models/update_profile_arg.dart';
import '../../features/update_profile/views/pages/update_profile_widget.dart';

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
        builder: (_) => BlocProvider(
          create: (context) => TodoCubit(),
          child: const TodoScreen(),
        ),
      );
    }
    if (settings.name == AddTodo.routeName) {
      final argument = settings.arguments as dynamic;
      return MaterialPageRoute(
        settings: const RouteSettings(name: AddTodo.routeName),
        builder: (_) => AddTodo(
          onAddTodo: argument,
        ),
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
            return BlocProvider(
              create: (context) => TodoCubit(),
              child: EditTodo(arg: arg),
            );
          });
    }
    if (settings.name == GoogleMapScreen.routeName) {
      return MaterialPageRoute(
        settings: const RouteSettings(name: GoogleMapScreen.routeName),
        builder: (_) => BlocProvider(
          create: (context) => GoogleMapCubit(),
          child: const GoogleMapScreen(),
        ),
      );
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
