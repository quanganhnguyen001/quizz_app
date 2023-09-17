import 'dart:convert';

class TodoModel {
  final String uid;
  String title;
  String description;
  String startTime;
  String endTime;
  String isDone;

  TodoModel({
    required this.uid,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'startTime': startTime});
    result.addAll({'endTime': endTime});
    result.addAll({'isDone': isDone});

    return result;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      uid: map['uid'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      isDone: map['isDone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));
}
