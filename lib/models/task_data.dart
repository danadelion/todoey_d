import 'package:flutter/material.dart';
import 'package:todoey_d/models/task.dart';
import 'package:todoey_d/models/task_database.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  TaskDatabase _taskDatabase;

  List<Task> _tasks = [];
  List<Task> _finishedTasks = [];

  bool isLoaded = false;

  TaskData(TaskDatabase taskDatabase) {
    this._taskDatabase = taskDatabase;
    taskDatabase.fetchTasks().then((List<Task> tasksFromDatabase) {
      tasksFromDatabase.forEach((Task taskFromDatabase) {
        if (taskFromDatabase.isDone == true) {
          _finishedTasks.add(taskFromDatabase);
        } else {
          _tasks.add(taskFromDatabase);
        }
      });
      isLoaded = true;
      notifyListeners();
    });
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get finishedTasks {
    return UnmodifiableListView(_finishedTasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    _taskDatabase.insertTask(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    _taskDatabase.updateTask(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    if (task.isDone == true) {
      _finishedTasks.add(task);
      _tasks.remove(task);
    } else {
      _tasks.add(task);
      _finishedTasks.remove(task);
    }
    _taskDatabase.updateTask(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    _finishedTasks.remove(task);
    _taskDatabase.removeTask(task);
    notifyListeners();
  }
}
