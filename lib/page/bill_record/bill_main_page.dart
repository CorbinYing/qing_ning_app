import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:qing_ning/db/isar/isar_helper.dart';
import 'package:qing_ning/model/bill_rocord/bill_info.dart';
import 'package:qing_ning/page/page_appbar_flex.dart';


class BillMainPage extends PageAppBarFlex {
  const BillMainPage({super.key, required super.title, required super.appBarHeight}) : super();

  @override
  State<BillMainPage> createState() => _BillMainPageState();
}

class _BillMainPageState extends State<BillMainPage> {
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
    // Isar.
    final isar = await IsarHelper().getInstance([BillInfoSchema]);


    double? max = await isar.billInfos.where().amountProperty().max();

    _counter = max?.toInt() ?? _counter;

    return _counter;
  }

  Future<void> _incrementCounter() async {
    _counter++;

    // Isar.
    final isar = await IsarHelper().getInstance([BillInfoSchema]);

    BillInfo billInfo = BillInfo()
      ..dateTime = DateTime.now()
      ..amount = _counter.toDouble();

    await isar.writeTxn(() async {
      await isar.billInfos.put(billInfo); // 将新用户数据写入到 Isar
    });

    setState(() {});
  }
}
