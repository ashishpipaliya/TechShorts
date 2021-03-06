import 'package:flutter/material.dart';
import 'package:techshorts/constants/tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TechShorts"),
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue.shade50,
            ),
            tabs: tabList,
          ),
        ),
        body: TabBarView(
          children: tabBarViewList,
        ),
      ),
    );
  }
}
