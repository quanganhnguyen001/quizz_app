import 'package:od/features/todo/models/todo_model.dart';

class EditTodoArg {
  final List<TodoModel> listTodo;
  final String title;
  final String description;
  final String uid;
  final String isDone;
  String starttime;
  String endTime;
  EditTodoArg({
    required this.listTodo,
    required this.title,
    required this.description,
    required this.uid,
    required this.isDone,
    required this.starttime,
    required this.endTime,
  });
}
