import 'package:flutter/material.dart';
import 'package:todoey_d/widgets/task_tile.dart';
import 'package:todoey_d/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function checkboxCallback;

  TasksList({@required this.tasks, @required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (index) {
            checkboxCallback(index);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
