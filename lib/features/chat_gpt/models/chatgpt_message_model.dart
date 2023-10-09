import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatgpt_message_model.freezed.dart';
part 'chatgpt_message_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    int? index,
    String? content,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
