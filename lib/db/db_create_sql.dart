class DatabaseCreateSQL {
  //程序计数表
  final String count_click_sql = '''
      CREATE TABLE IF NOT EXISTS count_click
      ( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
      click_count  BIGINT(20) ); ''';

  ///获取所有的sql建表语句
  Map<String, String> getAllTables() {
    Map<String, String> tables = <String, String>{};
    tables['count_click'] = count_click_sql;
    return tables;
  }
}
