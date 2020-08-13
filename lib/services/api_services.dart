import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techshorts/model/news_model.dart';

class ApiServices {
  final String url = "https://techshorts-news.herokuapp.com/api/v1";
  Future getNews() async {
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);

    return NewsModel.fromJson(data);
  }
}
