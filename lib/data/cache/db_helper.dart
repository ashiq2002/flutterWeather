import 'dart:async';
import 'package:api_cache_manager/models/cache_db_base_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

abstract class APICacheDBHelper {
  static Database? _db;
  static String tableName = "";

  static int get _version => 1;

  static Future<void> init(String table) async {
    tableName = table;
    if (_db != null) {
      return;
    }

    try {
      var databasesPath = await getDatabasesPath();
      String _path = p.join(databasesPath, 'api_cache_db.db');
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, key TEXT, syncData TEXT, syncTime INTEGER)',
    );
  }

  static void onUpgrade(Database db, int oldVersion, int version) async {
    if (oldVersion < version) {}
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db!.query(table);

  static Future<List<Map<String, dynamic>>> rawQuery(String sql) async =>
      _db!.rawQuery(sql);

  static Future<List<Map<String, dynamic>>> conditionalQuery(
      String table, String where, String searchString) async =>
      _db!.query(
        table,
        where: where,
        whereArgs: [searchString],
      );

  static Future<int> insert(
      String table,
      CacheDBBaseModel model,
      ) async =>
      await _db!.insert(table, model.toMap());

  static Future<int> update(
      String table,
      CacheDBBaseModel model, {
        String? columnName,
      }) async =>
      await _db!.update(
        table,
        model.toMap(),
        where: '$columnName = ?',
        whereArgs: [model.id],
      );

  static Future<int> customUpdate(String table, CacheDBBaseModel model,
      {String? columnName, String? columnValue}) async =>
      await _db!.update(
        table,
        model.toMap(),
        where: '$columnName = ?',
        whereArgs: [columnValue],
      );

  static Future<int> delete(
      String table,
      String columnName,
      String columnValue,
      ) async =>
      await _db!.delete(
        table,
        where: '$columnName = ?',
        whereArgs: [columnValue],
      );

  static Future<int> deleteAll(String table) async => await _db!.delete(
    table,
  );
}
