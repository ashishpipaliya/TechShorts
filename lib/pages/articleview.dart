//import 'dart:async';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//
//class ArticleView extends StatefulWidget {
//  final postUrl;
//  const ArticleView({Key key, this.postUrl}) : super(key: key);
//
//  @override
//  _ArticleViewState createState() => _ArticleViewState();
//}
//
//class _ArticleViewState extends State<ArticleView> {
//  bool isLoading = true;
//
//  final Completer<WebViewController> _completer =
//      Completer<WebViewController>();
//
//  WebViewController controller;
//  var url;
//
//  changeUrl() {
//    setState(() {
//      url =
//          "javascript:var currentsite=document.querySelector(\"meta[property='al:android:app_name']\")?document.querySelector(\"meta[property='al:android:app_name']\").content:window.location.href;function isPage(e){return console.log(e+\" \"+currentsite.includes(e)),currentsite.includes(e)}function process(e){var n=e;isPage(\"NYTimes\")&&(document.querySelector(\"html\").innerHTML=n),isPage(\"Medium\")&&(n=e.replace(/<\\/?noscript>/g,\"\"),document.querySelector(\"html\").innerHTML=n),(isPage(\"Bloomberg\")||isPage(\"businessinsider\"))&&((n=document.createElement(\"html\")).innerHTML=e,n.querySelectorAll(\"script\").forEach(function(e){return e.outerHTML=\"\"}),n=n.outerHTML,document.open(),document.write(n),document.close()),isPage(\"businessinsider\")&&((n=document.createElement(\"html\")).innerHTML=e,n.querySelectorAll(\"script\").forEach(function(e){return e.outerHTML=\"\"}),n.querySelectorAll(\"figure\").forEach(function(e){e.innerHTML=e.querySelector(\"noscript\").innerHTML}),n=n.outerHTML,document.open(),document.write(n),document.close())}fetch(window.location.href,{credentials:\"omit\",redirect:\"follow\",mode:\"no-cors\"}).then(function(e){return e.text()}).then(function(e){process(e)});";
//      controller.loadUrl(url);
//    });
//  }
//
//  @override
//  void initState() {
//    isLoading = true;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        children: [
//          WebView(
//            onWebViewCreated: ((WebViewController webViewController) {
//              webViewController.clearCache();
//              controller = webViewController;
//              _completer.complete(webViewController);
//            }),
//            initialUrl: widget.postUrl,
//            javascriptMode: JavascriptMode.unrestricted,
//            onPageFinished: (_) {
//              setState(() {
//                isLoading = false;
//              });
//            },
//          ),
//          isLoading
//              ? Center(
//                  child: CupertinoActivityIndicator(),
//                )
//              : Container(
//                  color: Colors.transparent,
//                ),
//        ],
//      ),
///*Floating action button*/
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          changeUrl();
//        },
//        child: Icon(Icons.chrome_reader_mode),
//        tooltip: "press me if full article does not visible",
//      ),
//    );
//  }
//}
