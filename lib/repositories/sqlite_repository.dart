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
    var script = await rootBundle.loadString('assets/sql/create_tables.sql');
    return await openDatabase(
      join(dbPath, 'puppy_diary.db'),
      version: 1,
      onCreate: (db, version) => db.execute(script),
    );
  }
}

class RaceRepository extends SQLiteRepository {

}

class GeneralRepository {

}
