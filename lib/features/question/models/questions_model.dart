import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'questions_model.freezed.dart';
part 'questions_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    String? question,
    List<String>? options,
    @JsonKey(name: 'correct_option') int? correctOption,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  static List<QuestionModel> questionFromjson(List question) {
    return question.map((e) {
      return QuestionModel.fromJson(e);
    }).toList();
  }
}
