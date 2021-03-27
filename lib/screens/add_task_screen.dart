import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:todoey_d/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Task task;
  AddTaskScreen({this.task});

  @override
  Widget build(BuildContext context) {
    String currentTaskName;
    TextEditingController _controller;

    _controller = new TextEditingController(text: task.name);

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                task.id == null ? 'Add Task' : 'Edit Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                controller: _controller,
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (String text) {
                  currentTaskName = text;
                },
              ),
              TextButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (currentTaskName == null) {
                    return;
                  }
                  task.name = currentTaskName;
                  if (task.id == null) {
                    Provider.of<TaskData>(context, listen: false).addTask(task);
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .updateTask(task);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
