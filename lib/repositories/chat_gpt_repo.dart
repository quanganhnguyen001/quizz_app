import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:od/features/chat_gpt/domain/entities/chatgpt_message_model.dart';

import '../api_key.dart';

class ChatGptRepo {
  final dio = Dio();
  // Future<List<ModelAI>> getModel() async {
  //   try {
  //     final response = await dio.get('https://api.openai.com/v1/models',
  //         options: Options(headers: {
  //           'Authorization': 'Bearer $API_KEY',
  //         }));
  //     Map json = response.data;
  //     List temp = [];
  //     for (var e in json['data']) {
  //       temp.add(e);
  //     }
  //     if (json['error'] != null) {
  //       throw HttpException(json['error']['message']);
  //     }

  //     return ModelAI.modelFromJson(temp);
  //   } catch (e) {
  //     print(e);
  //     throw e.toString();
  //   }
  // }

  Future<List<ChatModel>> sendMessage({required String message}) async {
    try {
      final response = await dio.post(
          'https://api.openai.com/v1/chat/completions',
          data: {
            'model': 'gpt-3.5-turbo',
            'messages': [
              {"role": "user", "content": message}
            ],
          },
          options: Options(headers: {
            'Authorization': 'Bearer $API_KEY',
            'Content-Type': 'application/json'
          }));

      Map json = response.data;

      if (json['error'] != null) {
        throw HttpException(json['error']['message']);
      }
      List<ChatModel> listChat = [];
      if (json['choices'].length > 0) {
        listChat = List.generate(
            json['choices'].length,
            (index) => ChatModel(
                message: json["choices"][index]["message"]['content'],
                chatIndex: 1));
      }

      return listChat;
    } catch (e) {
      throw e.toString();
    }
  }
}
