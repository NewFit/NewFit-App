import 'package:new_fit/app/data/local/db/db_models/user_info_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'newfit.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE UserInfo(user TEXT PRIMARY KEY, access_token TEXT, refresh_token TEXT, user_id INTEGER, authority_id INTEGER, oauth_history_id INTEGER)",
    );
  }

  Future<void> saveToken(UserInfo token) async {
    final db = await database;

    await db.insert('UserInfo', token.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserInfo?> getUserInfo() async {
    final db = await database;

    final List<Map<String, dynamic>> map = await db.query('UserInfo');

    if (map.isEmpty) {
      return null;
    }

    return UserInfo(
      access_token: map[0]['access_token'],
      refresh_token: map[0]['refresh_token'],
      user_id: map[0]['user_id'],
      authority_id: map[0]['authority_id'],
      oauth_history_id: map[0]['oauth_history_id'],
    );
  }

  Future<void> delete() async {
    final db = await database;
    await db.delete(
      'UserInfo',
      where: "user = ?",
      whereArgs: ["user"],
    );
  }
}
