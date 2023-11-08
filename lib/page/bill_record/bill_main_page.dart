import 'package:flutter/material.dart';
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
    return _counter;
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
  }
}

