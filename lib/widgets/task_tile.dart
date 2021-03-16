import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task.dart';
import 'package:todoey_d/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  TaskTile({this.task, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          taskData.removeTask(index);
        },
        child: ListTile(
          onLongPress: () {
            taskData.removeTask(index);
          },
          title: Text(
            task.name,
            style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
                color: task.textColor),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: task.isDone,
            onChanged: (checked) {
              taskData.toggleTask(index);
            },
          ),
        ),
      );
    });
  }
}
