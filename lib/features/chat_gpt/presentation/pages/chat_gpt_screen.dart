import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:od/features/chat_gpt/domain/entities/chatgpt_message_model.dart';
import 'package:od/features/chat_gpt/presentation/cubit/chat_gpt_cubit.dart';

import 'package:od/features/chat_gpt/presentation/widgets/chat_widget.dart';
import 'package:od/features/chat_gpt/presentation/widgets/text_widget.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/repositories/chat_gpt_repo.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';
import 'package:od/widgets_catalog/screen/base_screen/base_screen.dart';

import '../../../../gen/localization/l10n.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({super.key});
  static const String routeName = '/ChatGptScreen';

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  List<ChatModel> chatList = [];
  bool isTyping = false;
  final listScrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(scaffold: (ctx) {
      return BlocBuilder<ChatGptCubit, ChatGptState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorPalettes.chatGptBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 2,
              backgroundColor: ColorPalettes.cardColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Row(
                children: [
                  Assets.images.openaiLogo.image(height: 40, width: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ChatGPT',
                    style: AppTextStyle.H4(color: Colors.white),
                  ),
                ],
              ),
            ),
            body: SafeArea(
                child: Form(
              key: formKey,
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        controller: listScrollController,
                        itemCount: chatList.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                            message: chatList[index].message,
                            chatIndex: chatList[index].chatIndex,
                            showAnimate: chatList.length - 1 == index,
                          );
                        }),
                  ),
                  isTyping
                      ? SpinKitThreeBounce(
                          color: Colors.white,
                          size: 18,
                        )
                      : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: ColorPalettes.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Pls enter some text';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) async {
                              if (formKey.currentState!.validate()) {
                                sendMessageFCT();
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            controller:
                                context.read<ChatGptCubit>().chatController,
                            decoration: InputDecoration(
                              hintText: 'How can I help you',
                              hintStyle: AppTextStyle.paragraphMedium(
                                  color: Colors.grey),
                            ),
                          )),
                          IconButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  sendMessageFCT();
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
        },
      );
    });
  }

  scrollListToEnd() {
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future sendMessageFCT() async {
    if (isTyping) {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed((const Duration(seconds: 2)), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Assets.images.alertPassword.image(height: 56),
              content: Text(
                'You cant send multiple message at a time',
                textAlign: TextAlign.center,
                style: AppTextStyle.H4(color: Colors.red),
              ),
            );
          });
      return;
    }
    try {
      String message = context.read<ChatGptCubit>().chatController.text;
      setState(() {
        isTyping = true;
        chatList.add(ChatModel(message: message, chatIndex: 0));
        context.read<ChatGptCubit>().chatController.clear();
      });
      chatList.addAll(await ChatGptRepo().sendMessage(message: message));
      setState(() {});
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed((const Duration(seconds: 2)), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Assets.images.alertPassword.image(height: 56),
              content: Text(
                'Some error occured pls try again',
                textAlign: TextAlign.center,
                style: AppTextStyle.H4(color: Colors.red),
              ),
            );
          });
    } finally {
      setState(() {
        scrollListToEnd();
        isTyping = false;
      });
    }
  }
}
