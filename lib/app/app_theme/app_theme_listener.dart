import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme_cubit.dart';

class ThemeListener extends StatefulWidget {
  const ThemeListener({super.key, required this.builder});
  final Widget Function(BuildContext ctx) builder;

  @override
  State<ThemeListener> createState() => _ThemeListenerState();
}

class _ThemeListenerState extends State<ThemeListener> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (ctx, state) {
          return Stack(
            children: [
              widget.builder.call(ctx),
              // if (kDebugMode) const DevButton(),
            ],
          );
        },
      ),
    );
  }
}
