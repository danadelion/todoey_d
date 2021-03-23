import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:todoey_d/models/task_database.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  List<Function> migrationScripts = [
    // (int oldVersion, int newVersion) {
    //   if (oldVersion == 1) {
    //     return 'DROP TABLE tasks';
    //   }
    // },
    // (int oldVersion, int newVersion) {
    //   if (oldVersion == 2) {
    //     return 'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isDone BOOLEAN, textColor TEXT)';
    //   }
    // }
  ];

  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'tasks_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isDone BOOLEAN, textColor TEXT)",
      );
    },
    version: 1,
    onUpgrade: (Database db, int oldVersion, int newVersion) {
      migrationScripts.forEach((script) {
        return db.execute(script(oldVersion, newVersion));
      });
    },
  );

  runApp(MyApp(taskDatabase: TaskDatabase(database: database)));
}

class MyApp extends StatelessWidget {
  final TaskDatabase taskDatabase;
  MyApp({this.taskDatabase});

  @override
  Widget build(BuildContext context) {
    TaskData taskData = TaskData(taskDatabase);

    return ChangeNotifierProvider(
      create: (context) => taskData,
      child: MaterialApp(
        home: taskData.isLoaded == true
            ? SpinKitFadingCircle(
                color: Colors.lightBlue[700],
                size: 100.0,
              )
            : TasksScreen(),
      ),
    );
  }
}
