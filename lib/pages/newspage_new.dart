import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techshorts/services/database_service.dart';

Database apiServices = Database();

class NewsPageNew extends StatefulWidget {
  @override
  _NewsPageNewState createState() => _NewsPageNewState();
}

class _NewsPageNewState extends State<NewsPageNew> {
  var data;

  // getNews() async {
  //   final String url = "https://techshorts-news.herokuapp.com/api/v1";
  //   final response = await http.get(url);
  //   data = jsonDecode(response.body)["articles"];
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("TechShorts"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: Database().news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length ?? 0,
                  itemBuilder: (context, index) {
                    DocumentSnapshot news = snapshot.data.documents[index];
                    final String title = news["title"];
                    final String description = news["description"];
                    final String source = news["source"];
                    final String icon = news["icon"] ?? "icon";
                    final String imageUrl = news["imageurl"];
                    final String postUrl = news["posturl"];

                    return Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.07,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Opacity(
                                      opacity: 0.3,
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: imageUrl),
                                    ),
                                    Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: Image.asset(
                                          "assets/icons/$icon.png",
                                          width: 40,
                                          height: 40,
                                        ))
                                  ],
                                ),
                              ),
                              Text(
                                title,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                description,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 15.0, letterSpacing: 1.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                source,
                                style: TextStyle(
                                    fontSize: 10.0, letterSpacing: 1.0),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              } else {
                return Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: CupertinoActivityIndicator()),
                );
              }
            }),
      ),
    );
  }
}
