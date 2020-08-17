import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleView extends StatefulWidget {
  final source, postUrl;
  const ArticleView({Key key, this.source, this.postUrl}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool isLoading = true;
  double progress = 0;
  InAppWebViewController controller;
  var url;

  changeUrl() {
    setState(() {
      url =
          "javascript:var currentsite=document.querySelector(\"meta[property='al:android:app_name']\")?document.querySelector(\"meta[property='al:android:app_name']\").content:window.location.href;function isPage(e){return console.log(e+\" \"+currentsite.includes(e)),currentsite.includes(e)}function process(e){var n=e;isPage(\"NYTimes\")&&(document.querySelector(\"html\").innerHTML=n),isPage(\"Medium\")&&(n=e.replace(/<\\/?noscript>/g,\"\"),document.querySelector(\"html\").innerHTML=n),(isPage(\"Bloomberg\")||isPage(\"businessinsider\"))&&((n=document.createElement(\"html\")).innerHTML=e,n.querySelectorAll(\"script\").forEach(function(e){return e.outerHTML=\"\"}),n=n.outerHTML,document.open(),document.write(n),document.close()),isPage(\"businessinsider\")&&((n=document.createElement(\"html\")).innerHTML=e,n.querySelectorAll(\"script\").forEach(function(e){return e.outerHTML=\"\"}),n.querySelectorAll(\"figure\").forEach(function(e){e.innerHTML=e.querySelector(\"noscript\").innerHTML}),n=n.outerHTML,document.open(),document.write(n),document.close())}fetch(window.location.href,{credentials:\"omit\",redirect:\"follow\",mode:\"no-cors\"}).then(function(e){return e.text()}).then(function(e){process(e)});";
      controller.loadUrl(url: url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.source,
            style: TextStyle(fontSize: 17.0),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            isLoading
                ? LinearProgressIndicator(
                    value: progress,
                    minHeight: 3.0,
                    valueColor: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? AlwaysStoppedAnimation<Color>(Colors.black)
                        : AlwaysStoppedAnimation<Color>(Colors.blue),
                  )
                : Container(width: 0, height: 0),
            Expanded(
              child: InAppWebView(
                onWebViewCreated: ((InAppWebViewController webViewController) {
                  controller = webViewController;
                }),
                initialUrl: widget.postUrl,
                onLoadStop: (controller, url) {
                  changeUrl();
                  Future.delayed(
                      Duration(seconds: 1),
                      () => setState(() {
                            isLoading = false;
                          }));
                },
                onProgressChanged:
                    (InAppWebViewController _controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
