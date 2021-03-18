import 'package:flutter/material.dart';
import 'package:todoey_d/widgets/task_tile.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  TasksList({this.tasks});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              task: taskData.tasks[index],
              index: index,
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
