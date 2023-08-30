part of 'chat_gpt_cubit.dart';

class ChatGptState extends Equatable {
  const ChatGptState({required this.isTyping});
  final bool isTyping;

  ChatGptState copyWith(bool? isTyping) {
    return ChatGptState(isTyping: isTyping ?? this.isTyping);
  }

  @override
  List<Object> get props => [isTyping];
}
