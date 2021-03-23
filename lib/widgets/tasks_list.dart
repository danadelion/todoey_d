import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey_d/widgets/task_tile.dart';
import 'package:todoey_d/models/task.dart';

class TasksList extends StatelessWidget {
  final UnmodifiableListView<Task> tasks;

  TasksList({this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return TaskTile(
          task: tasks[index],
          index: index,
        );
      },
      itemCount: tasks.length,
    );
  }
}
//itemCount: taskData.taskCount,
