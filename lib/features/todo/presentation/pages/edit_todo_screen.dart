// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:od/common/widgets/buttons/button_components.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';
import 'package:od/features/todo/presentation/pages/todo_model.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class EditTodo extends StatefulWidget {
  EditTodo({
    Key? key,
    required this.listTodo,
    required this.title,
    required this.description,
    required this.uid,
    required this.starttime,
    required this.endTime,
    required this.isDone,
  }) : super(key: key);
  static const String routeName = '/EditTodo';
  final List<TodoModel> listTodo;
  final String title;
  final String description;
  final String uid;
  final String isDone;
  String starttime;
  String endTime;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  editTodo(String uid, String title, String description, String startTime,
      String endTime, String isDone) {
    final int index =
        widget.listTodo.indexWhere((element) => element.uid == uid);
    if (index > -1) {
      widget.listTodo[index].title = title;
      widget.listTodo[index].description = description;
      widget.listTodo[index].startTime = startTime;
      widget.listTodo[index].endTime = endTime;
      final listTodoSave = widget.listTodo;
      setData(listTodoSave);
    }
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    final json = jsonEncode(listTodoMap);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isSave', json);
  }

  selectStartTime(BuildContext context) async {
    final pickedStartTime = await showTimePicker(
        context: context, initialTime: convertTime(widget.starttime));
    if (pickedStartTime != null && pickedStartTime != widget.starttime) {
      setState(() {
        widget.starttime = pickedStartTime.toString();
      });
    }
  }

  selectEndTime(BuildContext context) async {
    final pickedEndTime = await showTimePicker(
        context: context, initialTime: convertTime(widget.endTime));
    if (pickedEndTime != null && pickedEndTime != widget.endTime) {
      setState(() {
        widget.endTime = pickedEndTime.toString();
      });
    }
  }

  convertTime(String time) {
    List<String> timeFormat = time.split(':');
    int hour = int.tryParse(timeFormat[0]) ?? 0;
    int minute = int.tryParse(timeFormat[1]) ?? 0;
    TimeOfDay selecTime = TimeOfDay(hour: hour, minute: minute);
    return selecTime;
  }

  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit todo',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFieldComponents(
              hinText: 'Enter title',
              controller: titleController,
              padding: const EdgeInsets.only(left: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFieldComponents(
              hinText: 'Enter description',
              controller: descriptionController,
              padding: const EdgeInsets.only(left: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    selectStartTime(context);
                  },
                  child: Text(
                    'Start Time: ${widget.starttime.toString().substring(10, 15)}',
                    style: const TextStyle(color: ColorPalettes.secondaryColor),
                  )),
              TextButton(
                  onPressed: () {
                    selectEndTime(context);
                  },
                  child: Text(
                      'End Time: ${widget.endTime.toString().substring(10, 15)}',
                      style: const TextStyle(color: Colors.red))),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonComponents(
                onPressed: () {
                  editTodo(
                      widget.uid,
                      titleController.text,
                      descriptionController.text,
                      widget.starttime,
                      widget.endTime,
                      widget.isDone);
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                title: 'Edit Todo',
                textStyle:
                    AppTextStyle.buttonMedium(color: ColorPalettes.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
