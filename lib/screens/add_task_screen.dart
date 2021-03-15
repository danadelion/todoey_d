import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:todoey_d/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onPressedCallback;

  AddTaskScreen({this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    String currentTaskName;

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
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (String text) {
                  currentTaskName = text;
                },
              ),
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (currentTaskName == null) {
                  return;
                }
                Provider.of<TaskData>(context, listen: false)
                    .addTask(Task(name: currentTaskName));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
