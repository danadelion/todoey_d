import 'package:flutter/material.dart';

class Task {
  int id;
  String name;
  Color textColor;
  bool isDone;

  Task({this.id, this.name, this.isDone = false, this.textColor: Colors.black});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'textColor': textColor.toString(),
      'isDone': isDone == true ? 1 : 0,
    };
  }
}
