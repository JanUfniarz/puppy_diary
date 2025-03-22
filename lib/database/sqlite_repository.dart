import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteRepository {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var dbPath = await getDatabasesPath();
    // uncomment to rebuild
    // await deleteDatabase(join(dbPath, 'puppy_diary.db'));

    return await openDatabase(
      join(dbPath, 'puppy_diary.db'),
      version: 1,
      onCreate: (db, version) async {

        // language=sql
        await db.execute('''
          CREATE TABLE dogs (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              full_name TEXT NOT NULL,
              birthday TEXT NOT NULL
          );
        ''');

        // language=sql
        await db.execute('''
          CREATE TABLE weight_history (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              time TEXT NOT NULL,
              weight REAL NOT NULL,
              individual_id INTEGER NOT NULL,
              FOREIGN KEY (individual_id) REFERENCES individuals (id) ON DELETE CASCADE
          );
        ''');

        // language=sql
        await db.execute('''
          CREATE TABLE event_history (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              time TEXT NOT NULL,
              done BOOLEAN NOT NULL,
              type TEXT NOT NULL,
              individual_id INTEGER NOT NULL,
              FOREIGN KEY (individual_id) REFERENCES individuals (id) ON DELETE CASCADE
          );
        ''');
      },
    );
  }
}
