part of 'chat_gpt_cubit.dart';

class ChatGptState extends Equatable {
  ChatGptState({
    required this.isTyping,
    required this.currentModel,
  });
  bool isTyping;
  String currentModel;

  ChatGptState copyWith({bool? isTyping, String? currentModel}) {
    return ChatGptState(
      isTyping: isTyping ?? this.isTyping,
      currentModel: currentModel ?? this.currentModel,
    );
  }

  @override
  List<Object> get props => [isTyping, currentModel];
}
