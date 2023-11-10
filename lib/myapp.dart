// import 'package:flutter/material.dart';
// import 'package:wallet_app/CardScreen.dart';
// import 'package:wallet_app/HomeScreen.dart';
// import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: WalletApp(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class WalletApp extends StatefulWidget {
//   @override
//   final databaseReference = Firestore.instance;
//
//   _WalletAppState createState() => _WalletAppState();
// }
//
// class _WalletAppState extends State<WalletApp> {
//   late int currentIndex;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     currentIndex = 0;
//   }
//
//   int  changePage(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//     return currentIndex;
//   }
//   var screens = [
//     HomeScreen(),
//     CardScreen(),
//   ]; //screens for each tab
//
//   int selectedTab = 0;
//   GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 81, 158, 1),key: _drawerKey,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         iconTheme: new IconThemeData(color: Colors.black),
//
//       )//,floatingActionButton: FloatingActionButton(
//       //     onPressed: () {},
//       //   child: Icon(Icons.add),
//       // backgroundColor: Colors.blueAccent,
//       //),
//       //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//       ,bottomNavigationBar: BubbleBottomBar(
//       hasNotch: true,
//       fabLocation: BubbleBottomBarFabLocation.end,
//       opacity: .2,
//       currentIndex: currentIndex,
//       onTap: changePage(currentIndex),
//       borderRadius: BorderRadius.vertical(
//           top: Radius.circular(
//               16)), //border radius doesn't work when the notch is enabled.
//       elevation: 8,
//       items: <BubbleBottomBarItem>[
//         BubbleBottomBarItem(
//             backgroundColor: Colors.blueAccent,
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//             activeIcon: Icon(
//               Icons.home,
//               color: Colors.white,
//             ),
//             title: Text("Home")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.deepPurple,
//             icon: Icon(
//               Icons.access_time,
//               color: Colors.black,
//             ),
//             activeIcon: Icon(
//               Icons.access_time,
//               color: Colors.deepPurple,
//             ),
//             title: Text("Logs")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.indigo,
//             icon: Icon(
//               Icons.folder_open,
//               color: Colors.black,
//             ),
//             activeIcon: Icon(
//               Icons.folder_open,
//               color: Colors.indigo,
//             ),
//             title: Text("Folders")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.green,
//             icon: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//             activeIcon: Icon(
//               Icons.menu,
//               color: Colors.green,
//             ),
//             title: Text("Menu"))
//       ],
//     ),
//
//
//
//       body: screens[selectedTab],
//     );
//   }
// }