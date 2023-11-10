import 'package:qing_ning/db/sqllite/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'db_create_sql.dart';

class DatabaseInit {

  /// 获取数据库中已存在的表
  Future<List<String>> getNeedCreateTables(Map<String, String> tables, Database db) async {
    Iterable<String> tableNames = tables.keys;
    //要创建的表

    List<Map<String, Object?>> tableMaps =
        await db.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');

    //已经存在的表
    Iterable<String> existingTables = tableMaps.map((e) => e['name'].toString());

    //需要新建的表
    List<String> createTables = [];
    for (String tableName in tableNames) {
      if (!existingTables.contains(tableName)) {
        createTables.add(tableName);
      }
    }
    return createTables;
  }

  Future init() async {
    //所有的sql语句
    DatabaseCreateSQL sqlTables = DatabaseCreateSQL();
    //所有的sql语句
    Map<String, String> allTableSql = sqlTables.getAllTables();
    // 打开数据库实例
    Database db = await DatabaseHelper().getDB();
    //检查需要生成的表
    List<String> noCreateTables = await getNeedCreateTables(allTableSql, db);

    if (noCreateTables.isNotEmpty) {
      //创建新表
      for (var table in noCreateTables) {
        await db.execute(allTableSql[table]!);
      }
    }
  }
}
