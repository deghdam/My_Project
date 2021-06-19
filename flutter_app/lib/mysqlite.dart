
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqlite_api.dart';

class SQLite {
  static Database _db;
  static String dbname = "foodmaster.db";
  static int _dbVersion = 1;

  //sql de creation des tables de db
  static List<String> _createtablestatement = [
    "Create table panier("
        "id INTEGER PRIMARY KEY,"
        "email Text,"
        "name text,"
        "prix Real,"
        "imageUrl text,"
        "ingredien text,"
        "nresto text,"
        "id_resto text,"
        "raiting text,"
        "type text,"
        "quantite INTEGER"
        ");",
  ];

  static Future<Database> getdb() async {
    if (_db != null) {
      return _db;
    } else {
      _db = await Opendb();
      return _db;
    }
  }

  static Future<Database> Opendb() async {
    String dir = await getDatabasesPath();
    String path = join(dir, dbname);
    var adb =
    await openDatabase(path, version: _dbVersion, onCreate: _FirstCreate);
    return adb;
  }

  static void _FirstCreate(Database db, int version) async {
    for (var i = 0; i <= _createtablestatement.length - 1; i++) {
      await db.execute(_createtablestatement[i]);
    }
  }

  static void Restart() async {
    String dir = await getDatabasesPath();
    String path = join(dir, dbname);
    File f = new File(path);
    if (!f.existsSync()) {
      deleteDatabase(path);
    }
  }

  static Future<void> Closedb() async {
    var db = await getdb();
    db.close();
    _db = null;
  }

}


