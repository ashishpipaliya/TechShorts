import 'package:flutter/material.dart';
import 'package:techshorts/pages/newspage_new.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NewsPageNew(),
    );
  }
}
