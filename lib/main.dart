import 'package:flutter/material.dart';
import 'package:techshorts/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechShorts',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
//      darkTheme: ThemeData(
//        brightness: Brightness.dark,
//      ),
      home: HomePage(),
    );
  }
}
