import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:od/common/widgets/buttons/toggle_buttons_components.dart';

import 'package:od/features/todo/presentation/widgets/add_todo_widget.dart';
import 'package:od/features/todo/presentation/pages/edit_todo_arguments.dart';
import 'package:od/features/todo/presentation/widgets/edit_todo_widget.dart';

import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';

import '../cubit/todo_cubit.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  static const String routeName = '/TodoScreen';

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    context.read<TodoCubit>().getData();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Todo List',
            ),
          ),
          body: ListView.builder(
            itemCount: state.listTodo.length,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      context
                          .read<TodoCubit>()
                          .deleteTodo(state.listTodo[index].uid);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    label: 'Delete',
                  )
                ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            state.listTodo[index].startTime
                                .toString()
                                .substring(10, 15),
                            style: AppTextStyle.H4(),
                          ),
                          ToggleButtonsComponents(
                              toggleValue:
                                  state.listTodo[index].isDone == "true",
                              onChanged: (value) {
                                setState(() {
                                  state.listTodo[index].isDone =
                                      value.toString();
                                  context.read<TodoCubit>().editTodo(
                                      state.listTodo[index].uid,
                                      state.listTodo[index].title,
                                      state.listTodo[index].description,
                                      state.listTodo[index].startTime,
                                      state.listTodo[index].endTime,
                                      state.listTodo[index].isDone);
                                });
                              }),
                          Text(
                            state.listTodo[index].isDone == "true"
                                ? 'Done'
                                : '',
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
                                        listTodo: state.listTodo,
                                        title: state.listTodo[index].title,
                                        description:
                                            state.listTodo[index].description,
                                        uid: state.listTodo[index].uid,
                                        isDone: state.listTodo[index].isDone,
                                        starttime:
                                            state.listTodo[index].startTime,
                                        endTime: state.listTodo[index].endTime))
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
                                    state.listTodo[index].title,
                                    style: AppTextStyle.H4(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    state.listTodo[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.paragraphSmall(
                                        color: ColorPalettes.darkgrayColor),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${state.listTodo[index].startTime.toString().substring(10, 15)} - ${state.listTodo[index].endTime.toString().substring(10, 15)}',
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
              Navigator.of(context).pushNamed(AddTodo.routeName,
                  arguments: context.read<TodoCubit>().addTodo);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
