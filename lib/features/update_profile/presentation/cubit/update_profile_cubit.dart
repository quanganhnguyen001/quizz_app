import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:od/features/auth/entities/user_model.dart';

import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/typhography.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileState(selectedImage: ''));
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  XFile? file;

  Future<void> selectImage(bool imageFrom) async {
    file = await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.camera : ImageSource.gallery);

    if (file != null) {
      emit(state.copyWith(file?.name));
    }
  }

  Future<void> updateProfile(BuildContext ctx) async {
    EasyLoading.show();
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('userImage')
          .child('/' + FirebaseAuth.instance.currentUser!.uid);
      await ref.putFile(File(file?.path ?? ''));
      String imageUrl = await ref.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(UserModel(
            name: nameController.text,
            phone: phoneController.text,
            imageUrl: imageUrl,
          ).toMap());
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
    }
    EasyLoading.dismiss();
    Navigator.of(ctx).pop();
  }
}
