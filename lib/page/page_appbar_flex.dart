import 'package:flutter/cupertino.dart';

abstract class PageAppBarFlex extends StatefulWidget {
  final String title;
  final double appBarHeight;

  const PageAppBarFlex({super.key, required this.title, required this.appBarHeight});
}
