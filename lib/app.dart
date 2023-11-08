import 'package:flutter/material.dart';
import 'package:qing_ning/db/db_init.dart';
import 'package:qing_ning/model/bill_rocord/bill_info.dart';
import 'package:qing_ning/router/main_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseInit init = DatabaseInit();
  await init.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "青柠记账",
      // theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: MainRoute(),
    );
  }
}
