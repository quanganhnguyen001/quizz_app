part of 'question_cubit.dart';

class QuestionState extends Equatable {
  QuestionState({required this.questionList});
  List<QuestionsModel> questionList = [];

  QuestionState copyWith({List<QuestionsModel>? questionList}) {
    return QuestionState(questionList: questionList ?? this.questionList);
  }

  @override
  List<Object> get props => [questionList];
}
