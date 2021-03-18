import 'package:sqflite/sqflite.dart';
import 'package:todoey_d/models/task.dart';

class TaskDatabase {
  Future<Database> database;

  TaskDatabase({this.database});

  static const tableName = 'tasks';

  Future<List<Task>> fetchTasks() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Task(
        name: maps[i]['name'],
        // isDone: (maps[i]['isDone'] ? true : false),
        // textColor: maps[i]['textColor'],
      );
    });
  }

  Future<void> insertTask(Task task) async {
    final Database db = await database;
    await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
