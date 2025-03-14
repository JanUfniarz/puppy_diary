import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteRepository {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async => await openDatabase(
      join(await getDatabasesPath(), 'puppy_diary.db'),
      version: 1,
      onCreate: (db, version) => db.execute(
        // language=SQL
        '''
        CREATE TABLE dogs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
        );
        CREATE TABLE breeds ();
        '''
      ),
    );
}

class IndividualRepository extends SQLiteRepository {

}

class RaceRepository extends SQLiteRepository {

}

class GeneralRepository {

}
