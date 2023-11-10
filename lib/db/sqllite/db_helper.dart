import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 数据库工具类
class DatabaseHelper {
  final String _dbName = "qing_ning.db";
  final int _dbVersion = 1;
  static Future<Database>? _db;

  static DatabaseHelper? _instance;

  DatabaseHelper._internal() {
    _instance = this;
  }

  // 工厂构造函数
  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Database> getDB() async {
    String dbPath = await getDatabasesPath();
    print('dbPath=$dbPath');
    //打开数据库实例
    _db ??= openDatabase(join(dbPath, _dbName), version: _dbVersion);
    return _db!;
  }
}
