import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:od/common/widgets/buttons/header_buttons_components.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../gen/localization/l10n.dart';
import '../../../auth/entities/user_model.dart';
import '../widgets/cell_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedImage = '';
  XFile? file;
  Future<UserModel?> loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (FirebaseAuth.instance.currentUser != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        return UserModel(
            imageUrl: userSnapshot['imageUrl'],
            name: userSnapshot['name'],
            email: userSnapshot['email'],
            phone: userSnapshot['phone']);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Str.of(context).profile,
            style: AppTextStyle.H4(),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<UserModel?>(
            future: loadUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
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
                                            Icons.account_circle,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            Str.of(context).see_profile_picture,
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
                                              final ref = FirebaseStorage
                                                  .instance
                                                  .ref()
                                                  .child('userImage')
                                                  .child('/' +
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid);
                                              await ref
                                                  .putFile(File(file!.path));
                                              String imageUrl =
                                                  await ref.getDownloadURL();
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
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
                                              Str.of(context)
                                                  .change_profile_picture,
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
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        Str.of(context).info_account,
                        style: AppTextStyle.H5(color: ColorPalettes.darkColor),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CellWidget(
                      icon: Icon(
                        Icons.person,
                        color: ColorPalettes.whiteColor,
                        size: 30,
                      ),
                      label: snapshot.data!.name ?? '',
                      title: Str.of(context).username,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CellWidget(
                      icon: Icon(
                        Icons.email,
                        color: ColorPalettes.whiteColor,
                        size: 30,
                      ),
                      label: snapshot.data!.email ?? '',
                      title: 'Email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CellWidget(
                      icon: Icon(
                        Icons.email,
                        color: ColorPalettes.whiteColor,
                        size: 30,
                      ),
                      label: snapshot.data!.phone.toString(),
                      title: 'Phone number',
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            context.read<AuthCubit>().logout();
                          },
                          child: Text(
                            Str.of(context).log_out,
                            style: AppTextStyle.buttonSmall(
                                color: ColorPalettes.darkgrayColor),
                          )),
                    )
                  ],
                );
              }
            }));
  }
}
