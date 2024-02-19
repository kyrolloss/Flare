import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'progress_database.db');
    return await openDatabase(
      path,
      version: 2, // تغيير رقم الإصدار بعد إضافة العمود
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE progress(
            id INTEGER PRIMARY KEY,
            reps INTEGER,
            weight INTEGER,
            date INTEGER
          )
          ''');
      },
      onUpgrade: onUpgrade,
    );
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('''
        ALTER TABLE progress
        ADD COLUMN name TEXT
        ''');
    }
  }

  Future<void> deleteOldDatabase() async {
    String databasePath = await getDatabasesPath();
    String pathToDelete = '$databasePath/progress_database.db';
    await deleteDatabase(pathToDelete);
  }

  Future<void> delete() async {
    Database? db = await database;
    db!.delete('progress');
  }

  Future<int> insertProgress(Map<String, dynamic> progressMap) async {
    Database? db = await database;
    return await db!.insert('progress', progressMap);
  }


  Future<List<Map<String, dynamic>>> fetchProgressData() async {
    Database? db = await database;
    return await db!.query('progress');
  }


  Future<List<Map<String, dynamic>>> getAllData({required String exerciseName, required List<Map<String, dynamic>> result}) async {
    try {
      // تنفيذ الاستعلام واستخدام القائمة الممررة كمتغير لتخزين النتائج
      await _database!.rawQuery('SELECT * FROM progress WHERE name = ?', [exerciseName]).then((value) {
        result.addAll(value);
      });
    } catch (error) {
      print(error.toString());

    }

    return result;
  }

  Future<void> close() async {
    Database? db = await database;
    db!.close();
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);
}