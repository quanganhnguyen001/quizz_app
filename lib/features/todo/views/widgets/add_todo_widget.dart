import 'package:flutter/material.dart';

import 'package:od/common/widgets/buttons/button_components.dart';
import 'package:od/common/widgets/fields/textfield_components.dart';

import 'package:uuid/uuid.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';
import '../../models/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({
    Key? key,
    required this.onAddTodo,
  }) : super(key: key);
  static const String routeName = '/AddTodo';

  final void Function(TodoModel todoModel) onAddTodo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var uid = const Uuid();
  late TodoModel todoModel;
  @override
  void initState() {
    titleController.addListener(() {
      setState(() {
        todoModel.title = titleController.text;
      });
    });
    descriptionController.addListener(() {
      setState(() {
        todoModel.description = descriptionController.text;
      });
    });
    todoModel = TodoModel(
        uid: uid.v4(),
        title: '',
        description: '',
        startTime: TimeOfDay.now().toString(),
        endTime: TimeOfDay.now().toString(),
        isDone: 'false');

    super.initState();
  }

  selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedStartTime =
        await showTimePicker(context: context, initialTime: startTime);
    if (pickedStartTime != null && pickedStartTime != startTime) {
      setState(() {
        startTime = pickedStartTime;
        todoModel.startTime = startTime.toString();
      });
    }
  }

  selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedEndTime =
        await showTimePicker(context: context, initialTime: endTime);
    if (pickedEndTime != null && pickedEndTime != endTime) {
      setState(() {
        endTime = pickedEndTime;
        todoModel.endTime = endTime.toString();
      });
    }
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
                  widget.onAddTodo.call(todoModel);

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
