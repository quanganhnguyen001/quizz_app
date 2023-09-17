import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:od/common/widgets/buttons/header_buttons_components.dart';

import 'package:od/gen/localization/l10n.dart';
import 'package:od/theme/typhography.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/fields/textfield_components.dart';

import '../../../../theme/color_palettes.dart';
import '../../cubit/update_profile_cubit.dart';
import '../../models/update_profile_arg.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = '/UpdateProfileWidget';
  const UpdateProfile({
    super.key,
    required this.arg,
  });
  final UpdateProfileArg arg;
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  void initState() {
    context.read<UpdateProfileCubit>().nameController.text = widget.arg.name;
    context.read<UpdateProfileCubit>().phoneController.text = widget.arg.phone;

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: HeaderButtonComponents(
            padding: const EdgeInsets.only(left: 5),
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        title: Text(
          Str.of(context).update_info,
          style: AppTextStyle.H4(),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        InkWell(
                            onTap: () {
                              showImageBottomSheet(ontap1: () {
                                context
                                    .read<UpdateProfileCubit>()
                                    .selectImage(ImageSource.camera);
                              }, ontap2: () {
                                context
                                    .read<UpdateProfileCubit>()
                                    .selectImage(ImageSource.gallery);
                              });
                            },
                            child: state.selectedImage.isEmpty
                                ? Center(
                                    child: Container(
                                        height: 155,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 3,
                                                color: ColorPalettes
                                                    .secondaryColor)),
                                        child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                widget.arg.imageUrl))),
                                  )
                                : Container(
                                    height: 155,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3,
                                            color:
                                                ColorPalettes.secondaryColor)),
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(File(
                                        context
                                                .read<UpdateProfileCubit>()
                                                .file
                                                ?.path ??
                                            '',
                                      )),
                                    ))),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFieldComponents(
                            controller: context
                                .read<UpdateProfileCubit>()
                                .nameController,
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
                            controller: context
                                .read<UpdateProfileCubit>()
                                .phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Str.of(context).valid_phone;
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
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<UpdateProfileCubit>()
                                      .updateProfile(context);
                                }
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  showImageBottomSheet({
    required void Function() ontap1,
    required void Function() ontap2,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
              height: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(children: [
                  InkWell(
                    onTap: ontap1,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          Str.of(context).from_camera,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: ontap2,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          Str.of(context).from_gallery,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ));
        });
  }
}
