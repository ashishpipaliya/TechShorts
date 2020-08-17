import 'package:flutter/material.dart';
import 'package:techshorts/constants/kolors.dart';
import 'package:techshorts/pages/lists/all_news.dart';
import 'package:techshorts/pages/lists/angular_news.dart';
import 'package:techshorts/pages/lists/aws_news.dart';
import 'package:techshorts/pages/lists/firebase_news.dart';
import 'package:techshorts/pages/lists/flutter_news.dart';
import 'package:techshorts/pages/lists/javascript_news.dart';
import 'package:techshorts/pages/lists/nodejs_news.dart';
import 'package:techshorts/pages/lists/react_news.dart';
import 'package:techshorts/pages/lists/vue_news.dart';

List<Color> bgColor = [
  kTechshorts,
  kFlutter,
  kReact,
  kAngular,
  kVue,
  kFirebase,
  kNodeJs,
  kJavascript,
  kAws
];

List<Widget> tabList = [
  Tab(child: Image.asset("assets/icons/icon.png", height: 30.0, width: 30.0)),
  Tab(
      child:
          Image.asset("assets/icons/flutter.png", height: 30.0, width: 30.0)),
  Tab(child: Image.asset("assets/icons/react.png", height: 30.0, width: 30.0)),
  Tab(
      child:
          Image.asset("assets/icons/angular.png", height: 30.0, width: 30.0)),
  Tab(child: Image.asset("assets/icons/vue.png", height: 30.0, width: 30.0)),
  Tab(
      child:
          Image.asset("assets/icons/firebase.png", height: 30.0, width: 30.0)),
  Tab(child: Image.asset("assets/icons/nodejs.png", height: 30.0, width: 30.0)),
  Tab(
      child: Image.asset("assets/icons/javascript.png",
          height: 30.0, width: 30.0)),
  Tab(child: Image.asset("assets/icons/aws.png", height: 30.0, width: 30.0)),
];

List<Widget> tabBarViewList = [
  Container(
    // color: bgColor[0],
    child: AllNews(),
  ),
  Container(
    child: FlutterNews(),
  ),
  Container(
    child: ReactNews(),
  ),
  Container(
    child: AngularNews(),
  ),
  Container(
    child: VueNews(),
  ),
  Container(
    child: FirebaseNews(),
  ),
  Container(
    child: NodeJsNews(),
  ),
  Container(
    child: JavascriptNews(),
  ),
  Container(
    child: AwsNews(),
  ),
];
