import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui_testing.dart';
import 'cubit/dev_button_cubit.dart';

import '../../gen/assets/assets.gen.dart';

class DevButton extends StatelessWidget {
  const DevButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DevButtonCubit(),
      child: BlocBuilder<DevButtonCubit, DevButtonState>(
        builder: (ctx, state) {
          return Positioned(
            left: state.offset.dx,
            top: state.offset.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                context.read<DevButtonCubit>().moveButton(details.delta);
              },
              child: FloatingActionButton(
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name !=
                      UITestingWidget.routeName) {
                    Navigator.of(context).pushNamed(UITestingWidget.routeName);
                  }
                },
                child: Assets.images.dev.image(),
              ),
            ),
          );
        },
      ),
    );
  }
}
