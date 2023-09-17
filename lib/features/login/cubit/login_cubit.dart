// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';

import 'package:od/repositories/auth_repo.dart';

import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/typhography.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginCubit() : super(const LoginState(isShowPassword: true));

  hideShowPassword() {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  Future login({
    required BuildContext ctx,
  }) async {
    EasyLoading.show();
    final Either<String, UserCredential> userCredential = await AuthRepo.login(
        email: emailController.text, password: passwordController.text);
    if (userCredential is Right<String, UserCredential>) {
      ctx.read<AuthCubit>().login(userCredential.value.user);
    } else if (userCredential is Left<String, UserCredential>) {
      showDialog(
          context: ctx,
          builder: (context) {
            Future.delayed((const Duration(seconds: 2)), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Assets.images.alertPassword.image(height: 56),
              content: Text(
                userCredential.value,
                textAlign: TextAlign.center,
                style: AppTextStyle.H4(color: Colors.red),
              ),
            );
          });
      emailController.clear();
      passwordController.clear();
    }
    EasyLoading.dismiss();
  }
}
