import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:od/repositories/chat_gpt_repo.dart';

import '../../domain/entities/chatgpt_message_model.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  final chatController = TextEditingController();

  ChatGptCubit()
      : super(ChatGptState(
          isTyping: false,
          currentModel: 'gpt-3.5-turbo',
        ));

  // Future sendMessage() async {
  //   try {
  //     emit(state.copyWith(isTyping: true));
  //     chatList.add(ChatModel(message: chatController.text, chatIndex: 0));
  //     chatController.clear();
  //     await ChatGptRepo().sendMessage(message: chatController.text);

  //   } catch (e) {
  //     throw e;
  //   } finally {
  //     emit(state.copyWith(isTyping: false));
  //   }
  // }
}
