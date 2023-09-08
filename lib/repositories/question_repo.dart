import 'package:dio/dio.dart';
import 'package:od/features/question/domain/entities/questions_model.dart';

class QuestionRepo {
  final dio = Dio();
  Future<List<QuestionsModel>> getQuestion() async {
    try {
      final response = await dio.get(
          'https://quizzapp-d56de-default-rtdb.asia-southeast1.firebasedatabase.app/question.json');
      final json = response.data;
      List tempList = [];
      for (var e in json) {
        tempList.add(e);
      }
      return QuestionsModel.questionFromjson(tempList);
    } catch (e) {
      rethrow;
    }
  }
}
