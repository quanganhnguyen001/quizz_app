import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  final chatController = TextEditingController();
  ChatGptCubit() : super(ChatGptState(isTyping: true));
}
