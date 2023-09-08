import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:od/repositories/question_repo.dart';

import '../../domain/entities/questions_model.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionState(questionList: []));

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
}
