import 'package:new_fit/app/data/local/db/db_models/token_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'newfit.db'),
        onCreate: (db, version) => _createDb(db), version: 2);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Token(user TEXT PRIMARY KEY, access_token TEXT, refresh_token TEXT)",
    );
  }

  Future<void> saveToken(DBToken token) async {
    final db = await database;

    await db.insert('Token', token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<DBToken?> getToken() async {
    final db = await database;

    final List<Map<String, dynamic>> map = await db.query('Token');

    if (map.isEmpty) {
      return null;
    }

    return DBToken(
      access_token: map[0]['access_token'],
      refresh_token: map[0]['refresh_token'],
    );
  }
}
