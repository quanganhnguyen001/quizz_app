import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/common/widgets/buttons/small_buttons_components.dart';
import 'package:od/common/widgets/buttons/social_buttons_components.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';

import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/gen/localization/l10n.dart';

import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../../common/widgets/buttons/button_components.dart';
import '../../../auth/base_screen.dart';
import '../../../forgot_pass/views/pages/forgot_password_screen.dart';
import '../../../register/views/pages/register_screen.dart';
import '../../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (context) {
      return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 52,
                      ),
                      Assets.images.coolKidsSitting.image(),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          Str.of(context).login,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.H4(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          Str.of(context).social_login,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.paragraphMedium(
                              color: ColorPalettes.darkgrayColor),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButtonsComponents(
                            width: 40,
                            height: 40,
                            radius: 8,
                            backgroundColor: ColorPalettes.secondaryColor,
                            icon: Assets.images.facebook.image(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SocialButtonsComponents(
                            width: 40,
                            height: 40,
                            radius: 8,
                            backgroundColor: ColorPalettes.secondaryColor,
                            icon: Assets.images.instagram.image(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SocialButtonsComponents(
                            width: 40,
                            height: 40,
                            radius: 8,
                            backgroundColor: ColorPalettes.secondaryColor,
                            icon: Assets.images.google.image(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFieldComponents(
                          controller:
                              context.read<LoginCubit>().emailController,
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
                          hinText: 'Email',
                          hintStyle: AppTextStyle.paragraphMedium(
                              color: ColorPalettes.darkgrayColor),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFieldComponents(
                          controller:
                              context.read<LoginCubit>().passwordController,
                          validator: (value) {
                            if (!RegExp(
                                    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                                .hasMatch(value ?? '')) {
                              return Str.of(context).valid_password;
                            }
                            return null;
                          },
                          obscureText: state.isShowPassword,
                          height: 53,
                          padding: const EdgeInsets.only(left: 16),
                          hinText: Str.of(context).password,
                          hintStyle: AppTextStyle.paragraphMedium(
                              color: ColorPalettes.darkgrayColor),
                          rightIcon: InkWell(
                            onTap: () {
                              context.read<LoginCubit>().hideShowPassword();
                            },
                            child: state.isShowPassword
                                ? Assets.images.passwordHide.image()
                                : Assets.images.passwordShow.image(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SmallButtonsComponents(
                        title: Str.of(context).forgot_pass,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName);
                        },
                        textStyle: AppTextStyle.buttonSmall(
                            color: ColorPalettes.darkgrayColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ButtonComponents(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                      ctx: context,
                                    );
                              }
                            },
                            height: 56,
                            radius: 16,
                            title: Str.of(context).login,
                            textStyle: AppTextStyle.buttonMedium(
                                color: ColorPalettes.whiteColor),
                            backgroundColor: ColorPalettes.primaryColor,
                          ),
                        ],
                      ),
                      SmallButtonsComponents(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        title: Str.of(context).dont_have_account,
                        textStyle: AppTextStyle.buttonSmall(
                            color: ColorPalettes.darkgrayColor),
                      )
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
