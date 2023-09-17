// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:od/common/widgets/buttons/button_components.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';
import '../../models/edit_todo_arguments.dart';
import '../../models/todo_model.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({
    Key? key,
    required this.arg,
  }) : super(key: key);
  static const String routeName = '/EditTodo';
  final EditTodoArg arg;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  editTodo(String uid, String title, String description, String startTime,
      String endTime, String isDone) {
    final int index =
        widget.arg.listTodo.indexWhere((element) => element.uid == uid);
    if (index > -1) {
      widget.arg.listTodo[index].title = title;
      widget.arg.listTodo[index].description = description;
      widget.arg.listTodo[index].startTime = startTime;
      widget.arg.listTodo[index].endTime = endTime;
      final listTodoSave = widget.arg.listTodo;
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
        context: context, initialTime: convertTime(widget.arg.starttime));
    if (pickedStartTime != null && pickedStartTime != widget.arg.starttime) {
      setState(() {
        widget.arg.starttime = pickedStartTime.toString();
      });
    }
  }

  selectEndTime(BuildContext context) async {
    final pickedEndTime = await showTimePicker(
        context: context, initialTime: convertTime(widget.arg.endTime));
    if (pickedEndTime != null && pickedEndTime != widget.arg.endTime) {
      setState(() {
        widget.arg.endTime = pickedEndTime.toString();
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
    titleController.text = widget.arg.title;
    descriptionController.text = widget.arg.description;
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
                    'Start Time: ${widget.arg.starttime.toString().substring(10, 15)}',
                    style: const TextStyle(color: ColorPalettes.secondaryColor),
                  )),
              TextButton(
                  onPressed: () {
                    selectEndTime(context);
                  },
                  child: Text(
                      'End Time: ${widget.arg.endTime.toString().substring(10, 15)}',
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
                      widget.arg.uid,
                      titleController.text,
                      descriptionController.text,
                      widget.arg.starttime,
                      widget.arg.endTime,
                      widget.arg.isDone);
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
