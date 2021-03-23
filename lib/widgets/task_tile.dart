import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoey_d/screens/add_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  TaskTile({this.task, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        direction: Axis.horizontal,
        child: Container(
          color: Colors.white,
          child: ListTile(
            onLongPress: () {
              taskData.removeTask(task);
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
                taskData.toggleTask(task);
              },
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(task: task),
              );
            },
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.redAccent,
            icon: Icons.delete,
            onTap: () => taskData.removeTask(task),
          ),
        ],
      );

      //   Dismissible(
      //   key: UniqueKey(),
      //   onDismissed: (direction) {
      //     // taskData.removeTask(index);
      //   },
      //   child: ListTile(
      //     onLongPress: () {
      //       taskData.removeTask(index);
      //     },
      //     title: Text(
      //       task.name,
      //       style: TextStyle(
      //           decoration: task.isDone ? TextDecoration.lineThrough : null,
      //           color: task.textColor),
      //     ),
      //     trailing: Checkbox(
      //       activeColor: Colors.lightBlueAccent,
      //       value: task.isDone,
      //       onChanged: (checked) {
      //         taskData.toggleTask(index);
      //       },
      //     ),
      //   ),
      // );
    });
  }
}
