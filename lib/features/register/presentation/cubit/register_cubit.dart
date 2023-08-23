// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';
import 'package:od/features/auth/entities/user_model.dart';
import 'package:od/gen/localization/l10n.dart';
import 'package:od/repositories/auth_repo.dart';

import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/typhography.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState(isShowPassword: true));
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  hideShowPassword() {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  Future signUp({required BuildContext ctx}) async {
    EasyLoading.show();
    final Either<String, UserCredential> userCredential = await AuthRepo.signUp(
        email: emailController.text, password: passwordController.text);
    if (userCredential is Right<String, UserCredential>) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.value.user!.uid)
          .set(UserModel(
            uid: userCredential.value.user!.uid,
            name: nameController.text,
            email: emailController.text,
            imageUrl: '',
            phone: Str.of(ctx).update_phone,
          ).toMap());
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
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }
    EasyLoading.dismiss();
  }
}
