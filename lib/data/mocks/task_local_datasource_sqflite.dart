import 'dart:async';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/todo.dart';

class TaskLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'task_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, completed INTEGER)');
  }

  Future<void> addTask(Todo todo) async {
    logInfo("Adding task to db");
    final db = await database;

    await db.insert(
      'tasks',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> getAllTasks() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        body: maps[i]['body'],
        completed: maps[i]['completed'],
      );
    });
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('tasks');
  }

  Future<void> deleteOne(id) async {
    Database db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
