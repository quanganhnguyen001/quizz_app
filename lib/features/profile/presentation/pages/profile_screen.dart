import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:od/common/cubit/cubit/user_cubit.dart';
import 'package:od/common/widgets/buttons/header_buttons_components.dart';
import 'package:od/features/auth/cubit/auth_cubit.dart';
import 'package:od/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';

import '../../../../gen/localization/l10n.dart';
import '../../../auth/entities/user_model.dart';
import '../widgets/cell_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });
  static const String routeName = '/ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<UserCubit>().loadUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                Str.of(context).profile,
                style: AppTextStyle.H4(),
              ),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                    child: Container(
                        height: 155,
                        width: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3, color: ColorPalettes.secondaryColor)),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.user?.imageUrl ?? '',
                          ),
                        ))),
                const SizedBox(
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
                  icon: const Icon(
                    Icons.person,
                    color: ColorPalettes.whiteColor,
                    size: 30,
                  ),
                  label: state.user?.name ?? '',
                  title: Str.of(context).username,
                ),
                const SizedBox(
                  height: 16,
                ),
                CellWidget(
                  icon: const Icon(
                    Icons.email,
                    color: ColorPalettes.whiteColor,
                    size: 30,
                  ),
                  label: state.user?.email ?? '',
                  title: 'Email',
                ),
                const SizedBox(
                  height: 16,
                ),
                CellWidget(
                  icon: const Icon(
                    Icons.phone,
                    color: ColorPalettes.whiteColor,
                    size: 30,
                  ),
                  label: state.user?.phone ?? '',
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
            ));
      },
    );
  }
}
