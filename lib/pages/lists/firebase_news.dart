import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techshorts/pages/articleview.dart';
import 'package:techshorts/services/database_service.dart';

class FirebaseNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: Database().firebase,
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

                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ArticleView(source: source, postUrl: postUrl))),
                  child: Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      elevation: 10.0,
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
                                        fit: BoxFit.cover, imageUrl: imageUrl),
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
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              description,
                              maxLines: 2,
                              style:
                                  TextStyle(fontSize: 15.0, letterSpacing: 1.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              source,
                              style:
                                  TextStyle(fontSize: 10.0, letterSpacing: 1.0),
                            ),
                          ],
                        ),
                      )),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                  width: 100, height: 100, child: CupertinoActivityIndicator()),
            );
          }
        });
  }
}
