//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
//import 'package:techshorts/pages/articleview.dart';
//
//class NewsPage extends StatefulWidget {
//  final articles;
//
//  const NewsPage({Key key, this.articles}) : super(key: key);
//
//  @override
//  _NewsPageState createState() => _NewsPageState();
//}
//
//class _NewsPageState extends State<NewsPage> {
//  PageController _controller = PageController(
//    initialPage: 0,
//  );
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    timeDilation = 0.2;
//    return widget.articles == null
//        ? Center(
//            child: CupertinoActivityIndicator(
//            radius: 50.0,
//          ))
//        : Scaffold(
//            body: PageView.builder(
//              controller: _controller,
//              allowImplicitScrolling: true,
//              scrollDirection: Axis.vertical,
//              physics: ScrollPhysics(),
//              itemCount: widget.articles["articles"].length,
//              itemBuilder: (context, index) {
//                final singleArticle = widget.articles["articles"][index];
//                final postUrl = singleArticle["posturl"];
//                return GestureDetector(
//                  onTap: () {
//                    Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    ArticleView(postUrl: postUrl)))
//                        .then((result) {});
//                  },
//                  onLongPress: () {
//                    Clipboard.setData(
//                        new ClipboardData(text: singleArticle["posturl"]));
//                  },
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Container(
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            CachedNetworkImage(
//                              imageUrl: singleArticle["imageurl"],
//                              width: MediaQuery.of(context).size.width,
//                              height: MediaQuery.of(context).size.height / 2.5,
//                              fit: BoxFit.contain,
//                            ),
//                            SizedBox(
//                              height: 15,
//                            ),
//                            Container(
//                              child: Padding(
//                                padding: const EdgeInsets.all(20),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      singleArticle["title"],
//                                      style: GoogleFonts.lato(
//                                          textStyle: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 23,
//                                              fontWeight: FontWeight.w500)),
//                                      maxLines: 2,
//                                    ),
//                                    SizedBox(
//                                      height: 15,
//                                    ),
//                                    Text(
//                                      singleArticle["description"],
//                                      style: GoogleFonts.getFont('Lato',
//                                          textStyle: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20,
//                                              fontWeight: FontWeight.w300)),
//                                      maxLines: 3,
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.symmetric(
//                                          vertical: 30),
//                                      child: Text(
//                                        singleArticle["source"],
//                                        style: TextStyle(
//                                          fontWeight: FontWeight.w400,
//                                          color: Colors.grey,
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            width: MediaQuery.of(context).size.width,
//                            color: Colors.blueGrey,
//                            child: Padding(
//                              padding: const EdgeInsets.all(10),
//                              child: Text(
//                                "Long press anywhere on screen to copy article link",
//                                maxLines: 1,
//                                style: TextStyle(
//                                  fontWeight: FontWeight.w200,
//                                  color: Colors.white,
//                                  fontSize: 15,
//                                ),
//                              ).shimmer(
//                                  duration: 10.seconds, showAnimation: true),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                );
//              },
//            ),
//            floatingActionButton: Padding(
//              padding: const EdgeInsets.only(bottom: 25),
//              child: FloatingActionButton(
//                child: Icon(Icons.refresh),
//                backgroundColor: Colors.blueGrey,
//                tooltip: "Navigate to top",
//                onPressed: () {
//                  _controller.animateToPage(0,
//                      duration: 10.seconds, curve: Curves.easeInOutCubic);
//                },
//              ),
//            ),
//          );
//  }
//}
//
//// ALoading Shimmer
//class ALoading extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Padding(
//        padding: const EdgeInsets.all(7),
//        child: Container(
//          child: Shimmer.fromColors(
//            period: Duration(seconds: 2),
//            baseColor: Colors.grey[300],
//            highlightColor: Colors.grey[100],
//            enabled: true,
//            direction: ShimmerDirection.ltr,
//            child: Padding(
//              padding: const EdgeInsets.all(10),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  Column(
//                    children: [
//                      LoadingImage(
//                        heightdiv: 3,
//                        widthdiv: 1,
//                      ),
//                      LineBlock(),
//                    ],
//                  ),
//                  Column(
//                    children: [
//                      ThinLine(
//                        width: 8,
//                        height: 40,
//                      ),
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class LoadingImage extends StatelessWidget {
//  @override
//  final double heightdiv, widthdiv;
//  const LoadingImage({Key key, this.heightdiv, this.widthdiv})
//      : super(key: key);
//  Widget build(BuildContext context) {
//    var imageheight = MediaQuery.of(context).size.height / heightdiv;
//    var imagewidth = MediaQuery.of(context).size.height / widthdiv;
//
//    return SingleChildScrollView(
//      physics: NeverScrollableScrollPhysics(),
//      child: Padding(
//        padding: const EdgeInsets.only(top: 10),
//        child: Container(
//          decoration: BoxDecoration(
//            color: Colors.grey,
//            borderRadius: BorderRadius.circular(10),
//          ),
//          height: imageheight,
//          width: imagewidth,
//        ),
//      ),
//    );
//  }
//}
//
//class ThinLine extends StatelessWidget {
//  final double height, width;
//  ThinLine({this.height, this.width});
//  @override
//  Widget build(BuildContext context) {
//    return SingleChildScrollView(
//      physics: NeverScrollableScrollPhysics(),
//      child: Row(
//        children: [
//          Padding(
//            padding: const EdgeInsets.only(top: 15),
//            child: Container(
//              width: (MediaQuery.of(context).size.width / 10) * width,
//              height: height,
//              decoration: BoxDecoration(
//                color: Colors.grey,
//                borderRadius: BorderRadius.circular(10),
//              ),
////                                color: Colors.grey,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class LineBlock extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: [
//        ThinLine(
//          height: 20,
//          width: 7,
//        ),
//        ThinLine(
//          height: 20,
//          width: 4,
//        ),
//        ThinLine(
//          height: 10,
//          width: 7,
//        ),
//        ThinLine(
//          height: 20,
//          width: 1,
//        ),
//      ],
//    );
//  }
//}
