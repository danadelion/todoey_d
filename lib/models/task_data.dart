import 'package:flutter/material.dart';
import 'package:todoey_d/models/task.dart';
import 'package:todoey_d/models/task_database.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  TaskDatabase _taskDatabase;

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

  bool isLoaded = false;

  TaskData(TaskDatabase taskDatabase) {
    this._taskDatabase = taskDatabase;
    taskDatabase.fetchTasks().then((List<Task> value) {
      this._tasks = value;
      isLoaded = true;
      notifyListeners();
    });
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    _taskDatabase.insertTask(newTask);
    notifyListeners();
  }

  void toggleTask(int index) {
    Task task = _tasks[index];
    task.toggleDone();
    _taskDatabase.updateTask(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
