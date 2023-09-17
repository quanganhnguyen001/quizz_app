// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:od/features/repositories/question_repo.dart';

import '../models/questions_model.dart';
import '../pages/widgets/results_widget.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(const QuestionState(questionList: []));
  final controller = PageController();

  Future<List<QuestionsModel>?> getAllQuestion() async {
    try {
      final questionListSnapShot = await QuestionRepo().getQuestion();
      List<QuestionsModel> questionList = questionListSnapShot
          .map((e) => QuestionsModel(
                question: e.question,
                correctOption: e.correctOption,
                options: e.options,
              ))
          .toList();
      emit(QuestionState(questionList: questionList));
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  pickAnswer({required int value, required int correctOptionIndex}) {
    emit(state.copyWith(selectedAnswerIndex: value));

    if (state.selectedAnswerIndex == correctOptionIndex) {
      final int newScore = state.score + 1;
      emit(state.copyWith(score: newScore));
    }
  }

  changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  nextQuestion(
      {required int currentIndex,
      required int listlength,
      required BuildContext context}) {
    if (currentIndex == listlength - 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultsWidget(
                score: state.score,
              )));
    }
    controller.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
    emit(state.copyWith(selectedAnswerIndex: -1));
  }
}
