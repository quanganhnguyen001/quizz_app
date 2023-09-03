import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:od/common/widgets/buttons/button_components.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';
import 'package:od/features/todo/presentation/pages/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:uuid/uuid.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({
    Key? key,
    required this.listTodo,
  }) : super(key: key);
  static const String routeName = '/AddTodo';
  final List<TodoModel> listTodo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var uid = const Uuid();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedStartTime =
        await showTimePicker(context: context, initialTime: startTime);
    if (pickedStartTime != null && pickedStartTime != startTime) {
      setState(() {
        startTime = pickedStartTime;
      });
    }
  }

  selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedEndTime =
        await showTimePicker(context: context, initialTime: endTime);
    if (pickedEndTime != null && pickedEndTime != endTime) {
      setState(() {
        endTime = pickedEndTime;
      });
    }
  }

  addTodo(TodoModel todoModel) {
    widget.listTodo.add(TodoModel(
      uid: todoModel.uid,
      title: todoModel.title,
      description: todoModel.description,
      startTime: todoModel.startTime,
      endTime: todoModel.endTime,
      isDone: 'false',
    ));
    final listTodoSave = widget.listTodo;
    setData(listTodoSave);
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    final json = jsonEncode(listTodoMap);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isSave', json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add todo',
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
                    'Start Time: ${startTime.format(context)}',
                    style: const TextStyle(color: ColorPalettes.secondaryColor),
                  )),
              TextButton(
                  onPressed: () {
                    selectEndTime(context);
                  },
                  child: Text('End Time: ${endTime.format(context)}',
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
                  addTodo(TodoModel(
                      uid: uid.v4(),
                      title: titleController.text,
                      description: descriptionController.text,
                      startTime: startTime.toString(),
                      endTime: endTime.toString(),
                      isDone: 'false'));
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                title: 'Add Todo',
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
