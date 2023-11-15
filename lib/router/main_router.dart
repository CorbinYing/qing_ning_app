import 'package:flutter/material.dart';
import '../page/bill_record/bill_main_page.dart';
import '../page/statistical_analysis/statisical_main_page.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainPageRouteState();
}

class _MainPageRouteState extends State<MainRoute> {
  int _selectedIndex = 0;
  final double _appBarHeight = 46;
  Widget? _currBody;

  @override
  Widget build(BuildContext context) {
    // _currBody = _currBody ?? BillMainPage(title: "首页", appBarHeight: _appBarHeight);
    _currBody = _currBody ?? StatisicalMainPage(title: "发现", appBarHeight: _appBarHeight);
    return Scaffold(
      body: _currBody,
      // bottomNavigationBar: BubbleBottomBar(
      //   opacity: 0.2,
      //   currentIndex: _selectedIndex,
      //   onTap: changePage,
      //   borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      //   elevation: 20,
      //   fabLocation: BubbleBottomBarFabLocation.end,
      //   //new
      //   hasNotch: true,
      //   //new
      //   hasInk: true,
      //   //new, gives a cute ink effect
      //   inkColor: Colors.black12,
      //   //optional, uses theme color if not specified
      //   items: const <BubbleBottomBarItem>[
      //     BubbleBottomBarItem(
      //         backgroundColor: Colors.lightBlue,
      //         icon: Icon(Icons.assignment_outlined, color: Colors.black54),
      //         activeIcon: Icon(Icons.assignment_sharp),
      //         title: Text("首页")),
      //     BubbleBottomBarItem(
      //         backgroundColor: Colors.lightBlue,
      //         icon: Icon(Icons.analytics_outlined, color: Colors.black54),
      //         activeIcon: Icon(Icons.analytics_sharp),
      //         title: Text("发现")),
      //     BubbleBottomBarItem(
      //         backgroundColor: Colors.lightBlue,
      //         icon: Icon(Icons.person_outline, color: Colors.black54),
      //         activeIcon: Icon(Icons.person_sharp),
      //         title: Text("我"))
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '我'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void changePage(int? index) {
    setState(() {
      _selectedIndex = index ?? 0;
    });
  }

  int _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        _currBody = BillMainPage(
          title: "首页",
          appBarHeight: _appBarHeight,
        );
        break;
      case 1:
        _currBody = StatisicalMainPage(
          title: "发现",
          appBarHeight: _appBarHeight,
        );
        break;
    }
    return _selectedIndex;
  }

}

/// 暂时不需要抽屉菜单
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Icon(Icons.account_circle_outlined),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}