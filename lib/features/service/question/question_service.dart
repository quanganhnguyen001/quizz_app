import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../question/models/questions_model.dart';

part 'question_service.g.dart';

@RestApi(
    baseUrl:
        'https://quizzapp-d56de-default-rtdb.asia-southeast1.firebasedatabase.app/')
abstract class QuestionService {
  factory QuestionService(Dio dio) = _QuestionService;

  @GET('question.json')
  Future<List<QuestionModel>> getQuestion();
}
