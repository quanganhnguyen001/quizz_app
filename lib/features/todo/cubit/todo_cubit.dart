// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  deleteTodo(String uid) {
    final updatedList =
        state.listTodo.where((element) => element.uid != uid).toList();
    emit(state.copyWith(listTodo: updatedList));
    final listTodoSave = state.listTodo;
    setData(listTodoSave);
    emit(state.copyWith(listTodo: listTodoSave));
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    final json = jsonEncode(listTodoMap);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isSave', json);
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('isSave');
    if (data != null && data.isNotEmpty) {
      try {
        final List<dynamic> listTodoMap = jsonDecode(data);
        final List<TodoModel> listTodoModel =
            listTodoMap.map((e) => TodoModel.fromMap(e)).toList();
        emit(state.copyWith(listTodo: listTodoModel));
      } catch (e) {
        print('Error parsing JSON: $e');
      }
    } else {
      print('No data found in SharedPreferences');
    }
  }

  addTodo(TodoModel todoModel) {
    final List<TodoModel> newList = [];
    newList.addAll(state.listTodo);
    newList.add(todoModel);
    emit(state.copyWith(listTodo: newList));
    final listTodoSave = state.listTodo;
    setData(listTodoSave);
  }

  editTodo(String uid, String title, String description, String startTime,
      String endTime, String isDone) {
    final int index =
        state.listTodo.indexWhere((element) => element.uid == uid);
    if (index > -1) {
      state.listTodo[index].title = title;
      state.listTodo[index].description = description;
      state.listTodo[index].startTime = startTime;
      state.listTodo[index].endTime = endTime;
      state.listTodo[index].isDone = isDone;
      final listTodoSave = state.listTodo;
      setData(listTodoSave);
    }
  }
}
