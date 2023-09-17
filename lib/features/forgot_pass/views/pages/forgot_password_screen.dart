import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/base_screen.dart';
import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';

import '../../../../common/widgets/fields/textfield_components.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../gen/localization/l10n.dart';
import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

import '../../cubit/forgot_pass_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = '/ForgotPasswordScreen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (context) {
      return BlocBuilder<ForgotPassCubit, ForgotPassState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: HeaderButtonComponents(
                              height: 48,
                              icon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorPalettes.darkColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Assets.images.coolKidsAloneTime.image(),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          Str.of(context).forgot_pass.substring(0, 13),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.H4(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          Str.of(context).forgot_pass_des,
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyle.paragraphMedium(color: Colors.red),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFieldComponents(
                          controller:
                              context.read<ForgotPassCubit>().emailController,
                          validator: (value) {
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value ?? "")) {
                              return Str.of(context).valid_email;
                            }
                            return null;
                          },
                          height: 53,
                          padding: const EdgeInsets.only(left: 16),
                          hinText: Str.of(context).enter_email,
                          hintStyle: AppTextStyle.paragraphMedium(
                              color: ColorPalettes.darkgrayColor),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ButtonComponents(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<ForgotPassCubit>()
                                    .resetPassword(ctx: context);
                              }
                            },
                            height: 56,
                            radius: 16,
                            title: Str.of(context).reset_password,
                            textStyle: AppTextStyle.buttonMedium(
                                color: ColorPalettes.whiteColor),
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
