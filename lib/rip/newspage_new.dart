import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techshorts/pages/lists/all_news.dart';
import 'package:techshorts/services/database_service.dart';

class NewsPageNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: AllNews(),
        ),
      ),
    );
  }
}
