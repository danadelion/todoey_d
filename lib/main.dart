import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:todoey_d/models/task_database.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'task_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tasks(name TEXT, isDone BOOLEAN, textColor TEXT)",
      );
    },
    version: 1,
  );

  runApp(MyApp(taskDatabase: TaskDatabase(database: database)));
}

class MyApp extends StatelessWidget {
  final TaskDatabase taskDatabase;
  MyApp({this.taskDatabase});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(taskDatabase),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
