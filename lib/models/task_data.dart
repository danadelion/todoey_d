import 'package:flutter/material.dart';
import 'package:todoey_d/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      name: 'Hint: swipe to delete',
      textColor: Colors.blueGrey,
    ),
    Task(
      name: 'Hint: long tap to delete',
      textColor: Colors.black54,
    ),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
