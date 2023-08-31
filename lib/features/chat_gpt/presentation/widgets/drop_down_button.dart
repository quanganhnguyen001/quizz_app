import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/features/chat_gpt/domain/entities/model_ai.dart';

import 'package:od/features/chat_gpt/presentation/cubit/chat_gpt_cubit.dart';
import 'package:od/repositories/chat_gpt_repo.dart';
import 'package:od/theme/color_palettes.dart';

import '../../../course/presentation/widgets/text_widget.dart';

class DropDownButtonWidget extends StatefulWidget {
  DropDownButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String currentModel = 'gpt-3.5-turbo';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelAI>>(
        future: ChatGptRepo().getModel(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                  child: DropdownButton(
                    style: TextStyle(fontSize: 100),
                    dropdownColor: ColorPalettes.chatGptBackgroundColor,
                    iconEnabledColor: Colors.white,
                    value: currentModel,
                    items: List<DropdownMenuItem<String>>.generate(
                        snapshot.data!.length,
                        (index) => DropdownMenuItem(
                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label: snapshot.data![index].id,
                              fontSize: 15,
                            ))),
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                    },
                  ),
                );
        });
  }
}
