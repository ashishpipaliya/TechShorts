import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techshorts/constants/tabs.dart';

class PracticeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab bar practice"),
          elevation: 0.0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicatorColor: Color(0XFF126511),
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
