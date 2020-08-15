import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // final String url = "https://techshorts-news.herokuapp.com/api/v1";
  // Future getNews() async {
  //   http.Response response = await http.get(url);
  //   Map data = jsonDecode(response.body);

  //   return NewsModel.fromJson(data);
  // }

  CollectionReference colRef = Firestore.instance.collection("news");

  Stream get news {
    return colRef.snapshots();
  }
}
