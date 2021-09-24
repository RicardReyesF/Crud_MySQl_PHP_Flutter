import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_and_mysql/src/pages/delete_page.dart';
import 'package:flutter_and_mysql/src/pages/home_page.dart';
import 'package:flutter_and_mysql/src/pages/update_page.dart';
import 'package:flutter_and_mysql/src/pages/view_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home'  : (BuildContext context) => HomePage(),
        'view'  : (BuildContext context) => ViewPage(),
        'update': (BuildContext context) => UpdatePage(),
        'delete': (BuildContext context) => DeletePage(),
      },
    );
  }
}
