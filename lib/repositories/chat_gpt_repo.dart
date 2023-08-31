import 'dart:io';

import 'package:dio/dio.dart';
import 'package:od/features/chat_gpt/domain/entities/model_ai.dart';

class ChatGptRepo {
  final dio = Dio();
  String API_KEY = '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';
  Future<List<ModelAI>> getModel() async {
    try {
      final response = await dio.get('https://api.openai.com/v1/models',
          options: Options(headers: {
            'Authorization': 'Bearer $API_KEY',
          }));
      Map json = response.data;
      List temp = [];
      for (var e in json['data']) {
        temp.add(e);
      }
      if (json['error'] != null) {
        throw HttpException(json['error']['message']);
      }

      return ModelAI.modelFromJson(temp);
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
