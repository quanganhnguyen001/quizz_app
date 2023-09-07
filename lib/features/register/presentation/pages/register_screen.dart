import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/common/widgets/buttons/header_buttons_components.dart';
import 'package:od/features/register/presentation/cubit/register_cubit.dart';
import 'package:od/widgets_catalog/screen/base_screen/base_screen.dart';

import '../../../../../common/widgets/buttons/button_components.dart';
import '../../../../../common/widgets/buttons/small_buttons_components.dart';
import '../../../../../common/widgets/fields/textfield_components.dart';
import '../../../../../theme/color_palettes.dart';
import '../../../../../theme/typhography.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../gen/localization/l10n.dart';
import '../../../login/presentation/pages/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (context) {
      return BlocBuilder<RegisterCubit, RegisterState>(
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
                      Assets.images.coolKidsStanding.image(),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          Str.of(context).signup,
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
                          Str.of(context).create_account,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.paragraphMedium(
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
                              context.read<RegisterCubit>().nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Str.of(context).valid_name;
                            }
                            return null;
                          },
                          height: 53,
                          padding: const EdgeInsets.only(left: 16),
                          hinText: Str.of(context).username,
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
                              context.read<RegisterCubit>().emailController,
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
                              context.read<RegisterCubit>().passwordController,
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
                              context.read<RegisterCubit>().hideShowPassword();
                            },
                            child: state.isShowPassword
                                ? Assets.images.passwordHide.image()
                                : Assets.images.passwordShow.image(),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ButtonComponents(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<RegisterCubit>().signUp(
                                      ctx: context,
                                    );
                              }
                            },
                            height: 56,
                            radius: 16,
                            title: Str.of(context).signup,
                            textStyle: AppTextStyle.buttonMedium(
                                color: ColorPalettes.whiteColor),
                            backgroundColor: ColorPalettes.primaryColor,
                          ),
                        ],
                      ),
                      SmallButtonsComponents(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        title: Str.of(context).have_account,
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
