part of 'question_cubit.dart';

class QuestionState extends Equatable {
  const QuestionState(
      {this.questionList = const [],
      this.selectedAnswerIndex = -1,
      this.currentIndex = 0,
      this.score = 0});
  final List<QuestionModel> questionList;
  final int selectedAnswerIndex;
  final int currentIndex;
  final int score;

  QuestionState copyWith({
    List<QuestionModel>? questionList,
    int? selectedAnswerIndex,
    int? currentIndex,
    int? score,
  }) {
    return QuestionState(
      questionList: questionList ?? this.questionList,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
    );
  }

  @override
  List<Object> get props =>
      [questionList, selectedAnswerIndex, score, currentIndex];
}
