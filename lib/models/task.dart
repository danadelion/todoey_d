import 'package:flutter/material.dart';

class Task {
  final String name;
  Color textColor;
  bool isDone;

  Task({this.name, this.isDone = false, this.textColor: Colors.black});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'textColor': textColor.toString(),
      'isDone': isDone,
    };
  }
}
