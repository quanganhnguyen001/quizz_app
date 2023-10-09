import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../api_key.dart';

part 'chat_gpt_service.g.dart';

@RestApi(baseUrl: 'https://api.openai.com/v1/chat/')
abstract class ChatGptService {
  factory ChatGptService(Dio dio) = _ChatGptService;

  @POST('/completions')
  @Headers(<String, dynamic>{
    'Authorization': 'Bearer $API_KEY',
    'Content-Type': 'application/json',
  })
  Future sendMessage(@Body() Map<String, dynamic> data);
}
