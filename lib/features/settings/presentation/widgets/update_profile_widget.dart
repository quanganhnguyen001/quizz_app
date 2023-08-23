import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:od/common/widgets/buttons/header_buttons_components.dart';
import 'package:od/gen/localization/l10n.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/fields/textfield_components.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../../theme/color_palettes.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  final formKey = GlobalKey<FormState>();
  String selectedImage = '';
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: HeaderButtonComponents(
            padding: EdgeInsets.only(left: 5),
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
        title: Text(
          Str.of(context).update_info,
          style: AppTextStyle.H4(),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.camera,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          Str.of(context).from_camera,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        file = await ImagePicker().pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 50);
                                        if (file != null) {
                                          setState(() {
                                            selectedImage = file!.name;
                                          });
                                          try {
                                            final ref = FirebaseStorage.instance
                                                .ref()
                                                .child('userImage')
                                                .child('/' +
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid);
                                            await ref.putFile(File(file!.path));
                                            String imageUrl =
                                                await ref.getDownloadURL();
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .update({
                                              'imageUrl': imageUrl,
                                            });
                                          } catch (e) {
                                            print(e);
                                          }
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.image,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            Str.of(context).from_gallery,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                ));
                          });
                    },
                    child: Center(
                        child: selectedImage.isEmpty
                            ? Container(
                                height: 155,
                                width: 140,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3,
                                        color: ColorPalettes.secondaryColor)),
                                child: Assets.images.avatarDefault.image())
                            : Container(
                                height: 155,
                                width: 140,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3,
                                        color: ColorPalettes.secondaryColor)),
                                child: CircleAvatar(
                                  backgroundImage: FileImage(File(
                                    file!.path,
                                  )),
                                ),
                              )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFieldComponents(
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
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFieldComponents(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Str.of(context).valid_name;
                        }
                        return null;
                      },
                      height: 53,
                      padding: const EdgeInsets.only(left: 16),
                      hinText: Str.of(context).phone,
                      hintStyle: AppTextStyle.paragraphMedium(
                          color: ColorPalettes.darkgrayColor),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ButtonComponents(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        height: 56,
                        radius: 16,
                        title: Str.of(context).save,
                        textStyle: AppTextStyle.buttonMedium(
                            color: ColorPalettes.whiteColor),
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
