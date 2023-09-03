import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:od/common/widgets/buttons/toggle_buttons_components.dart';

import 'package:od/features/todo/presentation/pages/add_todo_screen.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_arguments.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

import 'todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  static const String routeName = '/TodoScreen';

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  var uuid = const Uuid();

  List<TodoModel> listTodo = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo List',
        ),
      ),
      body: ListView.builder(
        itemCount: listTodo.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  setState(() {
                    deleteTodo(listTodo[index].uid);
                  });
                },
                icon: Icons.delete,
                backgroundColor: Colors.red,
                label: 'Delete',
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        listTodo[index].startTime.toString().substring(10, 15),
                        style: AppTextStyle.H4(),
                      ),
                      ToggleButtonsComponents(
                          toggleValue: listTodo[index].isDone == "true",
                          onChanged: (value) {
                            setState(() {
                              listTodo[index].isDone = value.toString();
                              editTodo(
                                  listTodo[index].uid,
                                  listTodo[index].title,
                                  listTodo[index].description,
                                  listTodo[index].startTime,
                                  listTodo[index].endTime,
                                  listTodo[index].isDone);
                            });
                          }),
                      Text(
                        listTodo[index].isDone == "true" ? 'Done' : '',
                        style: AppTextStyle.H5(color: Colors.red),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(EditTodo.routeName,
                                arguments: EditTodoArg(
                                    listTodo: listTodo,
                                    title: listTodo[index].title,
                                    description: listTodo[index].description,
                                    uid: listTodo[index].uid,
                                    isDone: listTodo[index].isDone,
                                    starttime: listTodo[index].startTime,
                                    endTime: listTodo[index].endTime))
                            .then(
                          (_) {
                            setState(() {});
                          },
                        );
                      },
                      child: Card(
                        color: Colors.red.shade50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listTodo[index].title,
                                style: AppTextStyle.H4(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                listTodo[index].description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.paragraphSmall(
                                    color: ColorPalettes.darkgrayColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${listTodo[index].startTime.toString().substring(10, 15)} - ${listTodo[index].endTime.toString().substring(10, 15)}',
                                style: AppTextStyle.H5(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AddTodo.routeName, arguments: listTodo)
              .then((_) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  deleteTodo(String uid) {
    listTodo.removeWhere((element) => element.uid == uid);
    final listTodoSave = listTodo;
    setData(listTodoSave);
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
    final List<dynamic> listTodoMap = jsonDecode(data ?? '');
    final List<TodoModel> listTodoModel =
        listTodoMap.map((e) => TodoModel.fromMap(e)).toList();
    setState(() {
      listTodo = listTodoModel;
    });
  }

  editTodo(String uid, String title, String description, String startTime,
      String endTime, String isDone) {
    final int index = listTodo.indexWhere((element) => element.uid == uid);
    if (index > -1) {
      listTodo[index].title = title;
      listTodo[index].description = description;
      listTodo[index].startTime = startTime;
      listTodo[index].endTime = endTime;
      listTodo[index].isDone = isDone;
      final listTodoSave = listTodo;
      setData(listTodoSave);
    }
  }
}
