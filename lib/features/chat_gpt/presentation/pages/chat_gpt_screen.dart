import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:od/features/chat_gpt/presentation/cubit/chat_gpt_cubit.dart';
import 'package:od/features/chat_gpt/presentation/widgets/drop_down_button.dart';
import 'package:od/features/course/presentation/widgets/chat_widget.dart';
import 'package:od/features/course/presentation/widgets/text_widget.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/repositories/chat_gpt_repo.dart';
import 'package:od/theme/color_palettes.dart';
import 'package:od/theme/typhography.dart';
import 'package:od/widgets_catalog/screen/base_screen/base_screen.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({super.key});
  static const String routeName = '/ChatGptScreen';

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
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
              actions: [
                IconButton(
                    onPressed: () {
                      buildBottomSheet();
                    },
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
              ],
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
                child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ChatWidget(
                          message: chatMessages[index]['msg'].toString(),
                          chatIndex: int.tryParse(chatMessages[index]
                                      ['chatIndex']
                                  .toString()) ??
                              0,
                        );
                      }),
                ),
                state.isTyping
                    ? Container()
                    : SpinKitThreeBounce(
                        color: Colors.white,
                        size: 18,
                      ),
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
                            child: TextField(
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
                              await ChatGptRepo().getModel();
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
            )),
          );
        },
      );
    });
  }

  buildBottomSheet() {
    return showModalBottomSheet(
        backgroundColor: ColorPalettes.chatGptBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        label: 'Choose Model:',
                        fontSize: 16,
                      ),
                    ),
                    DropDownButtonWidget()
                  ],
                ),
              ),
            ),
          );
        });
  }
}

final chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
        "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
];
