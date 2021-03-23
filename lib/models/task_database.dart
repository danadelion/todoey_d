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
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'] == 1,
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

  Future<void> updateTask(Task task) async {
    final Database db = await database;
    await db
        .update(tableName, task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> removeTask(Task task) async {
    final Database db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [task.id]);
  }
}
