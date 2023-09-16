// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:od/features/login/presentation/pages/login_screen.dart';

import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/typhography.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final emailController = TextEditingController();
  ForgotPassCubit() : super(const ForgotPassState());

  Future resetPassword({required BuildContext ctx}) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        showDialog(
            context: ctx,
            builder: (context) {
              return AlertDialog(
                actions: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginScreen.routeName, (route) => false);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Assets.images.check.image(height: 56),
                content: Text(
                  'Go check your email and Login again',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.H4(color: Colors.red),
                ),
              );
            });
      });
    } on FirebaseAuthException catch (e) {
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
                e.message.toString(),
                textAlign: TextAlign.center,
                style: AppTextStyle.H4(color: Colors.red),
              ),
            );
          });
      emailController.clear();
    }
    EasyLoading.dismiss();
  }
}
