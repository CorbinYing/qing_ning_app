import 'package:flutter/material.dart';
import 'package:qing_ning/db/sqllite/db_helper.dart';
import 'package:qing_ning/page/page_appbar_flex.dart';

class StatisicalMainPage extends PageAppBarFlex {
  const StatisicalMainPage({super.key, required super.title, required super.appBarHeight});

  @override
  State<StatisicalMainPage> createState() => _StatisicalMainPageState();
}


class _StatisicalMainPageState extends State<StatisicalMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(widget.appBarHeight),
        child: AppBar(
          title: Text(widget.title),
          // actions: <Widget>[ //导航栏右侧菜单
          //   IconButton(icon: Icon(Icons.share), onPressed: () {}),
          // ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('点击次数:'),
            FutureBuilder(
                future: getCounter(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(snapshot.data.toString());
                }),
            // Text(
            //   '()=>$getCounter()',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  int _counter = 0;

  Future<int> getCounter() async {
    var dataBase = await DatabaseHelper().getDB();

    List<Map<String, Object?>> query =
    await dataBase.rawQuery('select max(click_count) c from count_click');

    Object? count = query[0]['c'];
    if (count != null) {
      _counter = count as int;
    }
    return _counter;
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    var dataBase = await DatabaseHelper().getDB();
    await dataBase.rawInsert('insert into count_click(click_count) values($_counter)');
  }
}

class ClickCount {
  final int id;
  final String click_count;

  const ClickCount({required this.id, required this.click_count});
}
