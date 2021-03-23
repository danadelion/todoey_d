import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:todoey_d/widgets/tasks_list.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Task> finishedTasks =
        Provider.of<TaskData>(context).finishedTasks;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              child: Text(
                'Done tasks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: TasksList(tasks: finishedTasks),
            ),
          ],
        ),
      ),
    );
  }
}
