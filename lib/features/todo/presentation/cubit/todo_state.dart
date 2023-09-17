part of 'todo_cubit.dart';

class TodoState extends Equatable {
  const TodoState({
    this.listTodo = const [],
  });
  final List<TodoModel> listTodo;

  @override
  List<Object> get props => [listTodo];

  TodoState copyWith({
    List<TodoModel>? listTodo,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return TodoState(
      listTodo: listTodo ?? this.listTodo,
    );
  }
}
